import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager singleton = SharedPreferencesManager();

  SharedPreferences? _sharedPreferences;

  SharedPreferencesManager() {
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveValue<T>(
      String key,
      T value,
      Map<String, dynamic> Function(T value) modelToJsonConverter,
      ) async {
    try {
      if (_sharedPreferences == null) {
        await initializeSharedPreferences();
      }
      if (value is String) {
        _sharedPreferences!.setString(key, value);
      } else if (value is int) {
        _sharedPreferences!.setInt(key, value);
      } else if (value is double) {
        _sharedPreferences!.setDouble(key, value);
      } else if (value is bool) {
        _sharedPreferences!.setBool(key, value);
      } else {
        _sharedPreferences!
            .setString(key, json.encode(modelToJsonConverter(value)));
      }
      debugPrint("Saved to shared preferences: $key - $value");
    } catch (e) {
      debugPrint("Error while saving value to shared preferences: $e");
    }
  }

  Future<T?> getValue<T>(
      String key,
      T? defaultValue,
      T Function(dynamic json) convertJsonToModel,
      ) async {
    try {
      if (_sharedPreferences == null) {
        await initializeSharedPreferences();
      }
      if (T == String) {
        return (_sharedPreferences!.getString(key) ?? defaultValue) as T;
      } else if (T == int) {
        return (_sharedPreferences!.getInt(key) ?? defaultValue) as T;
      } else if (T == double) {
        return (_sharedPreferences!.getDouble(key) ?? defaultValue) as T;
      } else if (T == bool) {
        return (_sharedPreferences!.getBool(key) ?? defaultValue) as T;
      } else {
        var jsonString = _sharedPreferences!.getString(key);
        if (jsonString == null) {
          return defaultValue;
        } else {
          return convertJsonToModel(json.decode(jsonString));
        }
      }
    } catch (e) {
      debugPrint("Error while getting value from shared preferences: $e");
      return defaultValue;
    }
  }

  Future<bool> clear(String key) async {
    try {
      await _sharedPreferences?.remove(key);
      return true;
    } catch (e) {
      debugPrint("Error while clearing shared preferences: $e");
      return false;
    }
  }

  Future<bool> clearAll() async {
    try {
      await _sharedPreferences?.clear();
      return true;
    } catch (e) {
      debugPrint("Error while clearing shared preferences: $e");
      return false;
    }
  }
}
