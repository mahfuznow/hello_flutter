import 'package:data/local/shared_preference/entity/shared_preference_entity.dart';
import 'package:data/model/mappable.dart';
import 'package:domain/model/user_session.dart';

class UserSessionSharedPreferenceEntity extends SharedPreferenceEntity {
  String userId;
  String accessToken;
  String refreshToken;
  String? email;
  String? name;

  UserSessionSharedPreferenceEntity({
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

  factory UserSessionSharedPreferenceEntity.fromJson(
      Map<String, dynamic> json) {
    if (!json.containsKey('userId') ||
        !json.containsKey('accessToken') ||
        !json.containsKey('refreshToken')) {
      throw ArgumentError('Missing required keys in JSON');
    }

    return UserSessionSharedPreferenceEntity(
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
    return UserSessionSharedPreferenceEntity.fromJson(json);
  }

  @override
  String toString() {
    return 'AppUserSession(userId: $userId, accessToken: $accessToken, refreshToken: $refreshToken, email: $email, name: $name)';
  }

  @override
  String sharedPrefKey = 'app_user_session';

  static UserSessionSharedPreferenceEntity example =
      UserSessionSharedPreferenceEntity(
    userId: '1234',
    accessToken: 'example_access_token',
    refreshToken: 'example_refresh_token',
    name: 'John Doe',
    email: 'john_doe@gmail.com',
  );

  UserSession toUserSession() {
    return UserSession(
      userId: userId,
      accessToken: accessToken,
      refreshToken: refreshToken,
      email: email,
      name: name,
    );
  }
}
