import 'package:data/local/shared_preference/entity/app_theme_mode_shared_preference_entity.dart';
import 'package:data/local/shared_preference/entity/language_shared_preference_enity.dart';
import 'package:domain/model/app_language.dart';
import 'package:domain/model/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_viewmodel.dart';
import 'package:hello_flutter/util/app_logger.dart';

class AppViewModel extends BaseViewModel {
  final ValueNotifier<AppThemeMode> selectedThemeMode =
      ValueNotifier(AppThemeMode.system);

  final ValueNotifier<AppLanguage> selectedLanguage =
      ValueNotifier(AppLanguage.en);

  AppViewModel() {
    _initializeData();
  }

  void _initializeData() async {
    await _loadThemeFromPreferences();
    await _loadLanguageFromPreferences();
  }

  void onThemeChanged(AppThemeMode? theme) {
    theme ??= AppThemeMode.system;

    selectedThemeMode.value = theme;
    _saveThemeToPreferences(theme);
  }

  Future<void> _saveThemeToPreferences(AppThemeMode theme) async {
    AppThemeModeSharedPreferenceEntity themeMode =
        AppThemeModeSharedPreferenceEntity(themeMode: theme);
    await themeMode.saveToSharedPref();
  }

  Future<void> _loadThemeFromPreferences() async {
    AppThemeModeSharedPreferenceEntity.example
        .getFromSharedPref()
        .then((value) {
      AppLogger.d(value);
      AppThemeModeSharedPreferenceEntity appThemeModeSharedPreferenceEntity =
          (value as AppThemeModeSharedPreferenceEntity);
      selectedThemeMode.value = appThemeModeSharedPreferenceEntity.themeMode;
    });
  }

  void onLanguageChanged(AppLanguage? language) {
    // SharedPreferencesManager.singleton.saveValue('language', language, (obj) => {});

    language ??= AppLanguage.en;
    selectedLanguage.value = language;
    _saveLanguageToPreferences(language);
  }

  Future<void> _saveLanguageToPreferences(AppLanguage language) async {
    AppLanguageSharedPreferenceEntity appLanguage =
        AppLanguageSharedPreferenceEntity(appLanguage: language);
    await appLanguage.saveToSharedPref();
  }

  Future<void> _loadLanguageFromPreferences() async {
    // SharedPreferencesManager.singleton.getValue('language', AppLanguage.en, (obj) => {});

    AppLanguageSharedPreferenceEntity.example.getFromSharedPref().then((value) {
      AppLogger.d(value);
      AppLanguageSharedPreferenceEntity appLanguageSharedPreferenceEntity =
          (value as AppLanguageSharedPreferenceEntity);
      selectedLanguage.value = appLanguageSharedPreferenceEntity.appLanguage;
    });
  }
}
