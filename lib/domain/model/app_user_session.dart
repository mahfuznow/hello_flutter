import 'package:hello_flutter/domain/model/mappable.dart';
import 'package:hello_flutter/domain/model/shared_prefable.dart';

class AppUserSession extends SharedPrefable {
  String userId;
  String accessToken;
  String refreshToken;
  String? email;
  String? name;

  AppUserSession({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    this.email,
    this.name,
  }) {
    // Validate required fields
    if (userId.isEmpty) throw ArgumentError('userId cannot be empty');
    if (accessToken.isEmpty) throw ArgumentError('accessToken cannot be empty');
    if (refreshToken.isEmpty) {
      throw ArgumentError('refreshToken cannot be empty');
    }
  }

  factory AppUserSession.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('userId') ||
        !json.containsKey('accessToken') ||
        !json.containsKey('refreshToken')) {
      throw ArgumentError('Missing required keys in JSON');
    }

    return AppUserSession(
      userId: json['userId'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      email: json['email'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'email': email,
      'name': name,
    };
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    return AppUserSession.fromJson(json);
  }

  @override
  String toString() {
    return 'AppUserSession(userId: $userId, accessToken: $accessToken, refreshToken: $refreshToken, email: $email, name: $name)';
  }

  @override
  String sharedPrefKey = 'app_user_session';

  static AppUserSession example = AppUserSession(
    userId: '1234',
    accessToken: 'example_access_token',
    refreshToken: 'example_refresh_token',
    name: 'John Doe',
    email: 'john_doe@gmail.com',
  );
}
