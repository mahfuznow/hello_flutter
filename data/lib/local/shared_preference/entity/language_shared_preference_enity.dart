import 'package:data/local/shared_preference/entity/shared_preference_entity.dart';
import 'package:data/model/mappable.dart';
import 'package:domain/model/app_language.dart';

class AppLanguageSharedPreferenceEntity extends SharedPreferenceEntity {
  AppLanguage appLanguage;

  AppLanguageSharedPreferenceEntity({
    required this.appLanguage,
  });

  factory AppLanguageSharedPreferenceEntity.fromJson(
      Map<String, dynamic> json) {
    if (!json.containsKey('appLanguage')) {
      throw ArgumentError('Missing required keys in JSON');
    }
    return AppLanguageSharedPreferenceEntity(
      appLanguage: AppLanguage.fromString(json['appLanguage']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'appLanguage': appLanguage.toString(),
    };
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    return AppLanguageSharedPreferenceEntity.fromJson(json);
  }

  @override
  String sharedPrefKey = 'app_language';

  static AppLanguageSharedPreferenceEntity example =
      AppLanguageSharedPreferenceEntity(
    appLanguage: AppLanguage.en,
  );
}
