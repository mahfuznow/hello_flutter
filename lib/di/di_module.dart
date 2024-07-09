import 'package:hello_flutter/di/di_container.dart';
import 'package:hello_flutter/di/di_container_impl.dart';
import 'package:hello_flutter/util/app_logger.dart';

class DiModule {
  static final DiModule _instance = DiModule._internal();

  static final DiContainer _diContainer = DiContainerImpl();

  factory DiModule() => _instance;

  DiModule._internal();

  Future<void> registerSingleton<T>(T instance) async {
    try {
      await _diContainer.registerSingleton(instance);
    } catch (e) {
      AppLogger.e('Failed to register singleton $T: $e');
    }
  }

  Future<void> registerInstance<T>(T instance) async {
    try {
      await _diContainer.register(instance);
    } catch (e) {
      AppLogger.e('Failed to register instance $T: $e');
    }
  }

  Future<void> unregister<T>() async {
    try {
      await _diContainer.unregister<T>();
    } catch (e) {
      AppLogger.e('Failed to unregister $T: $e');
    }
  }

  Future<void> unregisterSingleton<T>() async {
    try {
      await _diContainer.unregisterSingleton<T>();
    } catch (e) {
      AppLogger.e('Failed to unregister singleton $T: $e');
    }
  }

  Future<T> resolve<T>() async {
    try {
      return await _diContainer.resolve<T>();
    } catch (e) {
      AppLogger.e('Failed to resolve $T: $e');
      rethrow;
    }
  }
}
