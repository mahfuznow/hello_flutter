import 'package:hello_flutter/data/local/shared_preference/entity/user_session_shared_preference_entity.dart';
import 'package:hello_flutter/domain/entity/user_session.dart';
import 'package:hello_flutter/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<UserSession> login({
    required String email,
    required String password,
  }) {
    //Dummy network call
    return Future.delayed(const Duration(seconds: 2), () {
      final user = UserSessionSharedPreferenceEntity(
        userId: '324234',
        accessToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
        refreshToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwicmVmcmVzaCI6eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZXMiOlsiUk9MRV9BRE1JTiJdfSwiaWF0IjoxNjM2MjUxMjIyLCJleHAiOjE2MzYyNTMwMjJ9.KG98H0x74oUukbP9g1tM5JylZL4j2WXjBL-N3s-cXoU',
        name: 'John Doe',
        email: email,
      );
      user.saveToSharedPref();
      return user.toUserSession();
    });
  }

  @override
  Future<bool> isLoggedIn() {
    return Future.delayed(const Duration(seconds: 2), () {
      return true;
    });
  }

  @override
  Future<bool> logout() {
    return Future.delayed(const Duration(seconds: 2), () {
      UserSessionSharedPreferenceEntity.example.deleteFromSharedPref();
      return true;
    });
  }

  @override
  Future<UserSession> register({
    required String email,
    required String password,
  }) {
    //Dummy network call
    return Future.delayed(const Duration(seconds: 2), () {
      final user = UserSessionSharedPreferenceEntity(
        userId: '324234',
        accessToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
        refreshToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwicmVmcmVzaCI6eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZXMiOlsiUk9MRV9BRE1JTiJdfSwiaWF0IjoxNjM2MjUxMjIyLCJleHAiOjE2MzYyNTMwMjJ9.KG98H0x74oUukbP9g1tM5JylZL4j2WXjBL-N3s-cXoU',
        name: 'John Doe',
        email: email,
      );
      return user.toUserSession();
    });
  }
}
