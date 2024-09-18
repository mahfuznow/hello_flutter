import 'package:domain/model/app_language.dart';
import 'package:flutter/material.dart';

extension AppLanguageExtension on AppLanguage {
  Locale get toLanguage => Locale(name);
}

List<Locale> get supportedLanguages => AppLanguage.values
    .map((AppLanguage language) => language.toLanguage)
    .toList();
