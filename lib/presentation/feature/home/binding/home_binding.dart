import 'package:hello_flutter/presentation/base/base_binding.dart';
import 'package:hello_flutter/presentation/feature/home/home_view_model.dart';

class HomeBinding extends BaseBinding {
  @override
  Future<void> addDependencies() async {
    return diModule.registerInstance(HomeViewModel());
  }

  @override
  Future<void> removeDependencies() async {
    return diModule.unregister<HomeViewModel>();
  }
}
