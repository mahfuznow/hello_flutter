import 'dart:io';

import 'package:data/local/shared_preference/shared_preferences_manager.dart';
import 'package:domain/model/app_language.dart';
import 'package:domain/model/app_theme_mode.dart';
import 'package:domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final String deviceSettingsLocaleName = Platform.localeName;
  final String deviceSettingsThemeMode = 'system';

  @override
  Future<AppLanguage> getApplicationLocale() async {
    String? savedAppLanguageLocaleString = await SharedPreferencesManager
        .singleton
        .getValue<String>('language', null, (obj) => obj as String);
    if (savedAppLanguageLocaleString == null) {
      return AppLanguage.fromString(deviceSettingsLocaleName);
    }
    return AppLanguage.fromString(savedAppLanguageLocaleString);
  }

  @override
  Future<AppThemeMode> getApplicationThemeMode() async {
    String? savedAppThemeModeString = await SharedPreferencesManager.singleton
        .getValue<String>('theme', null, (obj) => obj as String);
    if (savedAppThemeModeString == null) {
      return AppThemeMode.fromString(deviceSettingsThemeMode);
    }
    return AppThemeMode.fromString(savedAppThemeModeString);
  }

  @override
  Future<void> saveApplicationLocale(AppLanguage appLanguage) {
    return SharedPreferencesManager.singleton.saveValue(
      'language',
      appLanguage.toString(),
      (obj) => {},
    );
  }

  @override
  Future<void> saveApplicationThemeMode(AppThemeMode themeMode) {
    return SharedPreferencesManager.singleton.saveValue(
      'theme',
      themeMode.toString(),
      (obj) => {},
    );
  }
}
