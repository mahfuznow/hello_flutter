import 'dart:async';

import 'package:domain/di/di_container.dart';

class DiContainerImpl extends DiContainer {
  static final DiContainerImpl _instance = DiContainerImpl._internal();

  factory DiContainerImpl() => _instance;

  final Map<String, List<dynamic>> _dependencies = {};
  final Map<String, dynamic> _singletons = {};

  // Using AsyncLock ensures thread safety when accessing shared resources in an
  // asynchronous environment. In Dart, operations such as registering and
  // resolving dependencies might happen concurrently, leading to race conditions
  // and data inconsistencies. The AsyncLock class helps synchronize these operations,
  // ensuring that only one operation can modify the shared resources at a time.
  final _lock = AsyncLock();

  DiContainerImpl._internal();

  @override
  Future<void> register<T>(T instance) async {
    final key = T.toString();
    await _lock.synchronized(() {
      if (!_dependencies.containsKey(key)) {
        _dependencies[key] = [];
      }
      _dependencies[key]!.add(instance);
    });
  }

  @override
  Future<void> registerSingleton<T>(T instance) async {
    final key = T.toString();
    await _lock.synchronized(() {
      if (_singletons.containsKey(key)) {
        throw DependencyError.alreadyRegistered;
      }
      _singletons[key] = instance;
    });
  }

  @override
  Future<T> resolve<T>() async {
    final key = T.toString();
    return await _lock.synchronized<T>(() {
      if (_singletons.containsKey(key)) {
        return _singletons[key] as T;
      } else if (_dependencies.containsKey(key) &&
          _dependencies[key]!.isNotEmpty) {
        return _dependencies[key]!.last as T;
      } else {
        throw DependencyError.notRegistered;
      }
    });
  }

  @override
  Future<bool> isRegistered<T>() async {
    final key = T.toString();
    return await _lock.synchronized(() {
      return (_dependencies.containsKey(key) &&
              _dependencies[key]!.isNotEmpty) ||
          _singletons.containsKey(key);
    });
  }

  @override
  Future<void> unregister<T>() async {
    final key = T.toString();
    if (!(await isRegistered<T>())) {
      throw DependencyError.notRegistered;
    }
    await _lock.synchronized(() {
      _dependencies[key]?.removeLast();
    });
  }

  @override
  Future<void> unregisterSingleton<T>() async {
    final key = T.toString();
    if (!(await isRegistered<T>())) {
      throw DependencyError.notRegistered;
    }
    await _lock.synchronized(() {
      _singletons.remove(key);
    });
  }
}

enum DependencyError implements Exception {
  alreadyRegistered,
  notRegistered,
}

class AsyncLock {
  Completer<void>? _lock;

  Future<T> synchronized<T>(FutureOr<T> Function() action) async {
    _lock ??= Completer<void>();

    if (!_lock!.isCompleted) {
      _lock!.complete();
    }

    await _lock!.future;
    try {
      return action();
    } finally {
      if (!_lock!.isCompleted) {
        _lock!.complete();
      }
      _lock = null; // Reset lock after completion
    }
  }
}
