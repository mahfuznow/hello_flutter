import 'package:hello_flutter/di/di_module.dart';

abstract class BaseBinding {
  final DiModule diModule = DiModule();

  Future<void> addDependencies();

  Future<void> removeDependencies();
}
