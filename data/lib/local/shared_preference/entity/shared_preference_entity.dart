// This class is used to save, retrieve and delete data from shared preferences
import 'package:data/local/shared_preference/shared_preferences_manager.dart';
import 'package:data/model/mappable.dart';

abstract class SharedPreferenceEntity implements Mappable {
  abstract String sharedPrefKey;

  final SharedPreferencesManager _sharedPreferencesManager =
      SharedPreferencesManager.singleton;

  Future<void> saveToSharedPref() {
    return _sharedPreferencesManager.saveValue(
      sharedPrefKey,
      this,
      (obj) => obj.toJson(),
    );
  }

  //TODO: Find an way to make this method static so that it can be called without creating an instance of the class
  Future<Mappable?> getFromSharedPref() async {
    return _sharedPreferencesManager.getValue(
      sharedPrefKey,
      this,
      (json) => fromJson(json),
    );
  }

  Future<bool> deleteFromSharedPref() async {
    return _sharedPreferencesManager.clear(sharedPrefKey);
  }
}
