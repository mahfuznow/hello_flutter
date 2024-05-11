import 'package:flutter/foundation.dart';
import 'package:hello_flutter/base/base_viewmodel.dart';
import 'package:hello_flutter/feature/home/route/home_argument.dart';
import 'package:hello_flutter/util/app_logger.dart';

class HomeViewModel extends BaseViewModel<HomeArgument> {
  final ValueNotifier<String?> _userId = ValueNotifier(null);

  ValueListenable<String?> get userId => _userId;

  @override
  onViewReady({HomeArgument? argument}) {
    AppLogger.d("HomeViewModel onViewReady");
    _userId.value = argument?.userId;
  }

  onClickBack() {
    navigateBack();
  }
}
