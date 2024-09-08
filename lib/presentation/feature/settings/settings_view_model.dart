import 'package:domain/model/app_language.dart';
import 'package:domain/model/app_theme_mode.dart';
import 'package:hello_flutter/presentation/app/app_viewmodel.dart';
import 'package:hello_flutter/presentation/base/base_viewmodel.dart';
import 'package:hello_flutter/presentation/feature/settings/route/settings_argument.dart';

class SettingsViewModel extends BaseViewModel<SettingsArgument> {
  SettingsViewModel({required this.appViewModel});
  final AppViewModel appViewModel;

  @override
  void onViewReady({SettingsArgument? argument}) {
    super.onViewReady();
  }

  void onThemeChanged(AppThemeMode? value) {
    appViewModel.onThemeChanged(value);
  }

  void onLanguageChanged(AppLanguage? value) {
    appViewModel.onLanguageChanged(value);
  }
}
