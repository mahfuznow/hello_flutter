import 'package:data/local/shared_preference/entity/shared_preference_entity.dart';
import 'package:data/model/mappable.dart';
import 'package:domain/model/app_theme_mode.dart';

class AppThemeModeSharedPreferenceEntity extends SharedPreferenceEntity {
  AppThemeMode themeMode;

  AppThemeModeSharedPreferenceEntity({
    required this.themeMode,
  });

  factory AppThemeModeSharedPreferenceEntity.fromJson(
      Map<String, dynamic> json) {
    if (!json.containsKey('themeMode')) {
      throw ArgumentError('Missing required keys in JSON');
    }
    return AppThemeModeSharedPreferenceEntity(
      themeMode: AppThemeMode.fromString(json['themeMode']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.toString(),
    };
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    return AppThemeModeSharedPreferenceEntity.fromJson(json);
  }

  @override
  String sharedPrefKey = 'app_theme_mode';

  static AppThemeModeSharedPreferenceEntity example =
      AppThemeModeSharedPreferenceEntity(
    themeMode: AppThemeMode.system,
  );
}
