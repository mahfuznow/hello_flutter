import 'package:hello_flutter/domain/model/app_user_session.dart';
import 'package:hello_flutter/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<AppUserSession> login({
    required String email,
    required String password,
  }) {
    //Dummy network call
    return Future.delayed(const Duration(seconds: 2), () {
      final user = AppUserSession(
        userId: '324234',
        accessToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
        refreshToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwicmVmcmVzaCI6eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZXMiOlsiUk9MRV9BRE1JTiJdfSwiaWF0IjoxNjM2MjUxMjIyLCJleHAiOjE2MzYyNTMwMjJ9.KG98H0x74oUukbP9g1tM5JylZL4j2WXjBL-N3s-cXoU',
        name: 'John Doe',
        email: email,
      );
      user.saveToSharedPref();
      return user;
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
      AppUserSession.example.deleteFromSharedPref();
      return true;
    });
  }

  @override
  Future<AppUserSession> register({
    required String email,
    required String password,
  }) {
    //Dummy network call
    return Future.delayed(const Duration(seconds: 2), () {
      final user = AppUserSession(
        userId: '324234',
        accessToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
        refreshToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwicmVmcmVzaCI6eyJ1c2VybmFtZSI6ImFkbWluIiwicm9sZXMiOlsiUk9MRV9BRE1JTiJdfSwiaWF0IjoxNjM2MjUxMjIyLCJleHAiOjE2MzYyNTMwMjJ9.KG98H0x74oUukbP9g1tM5JylZL4j2WXjBL-N3s-cXoU',
        name: 'John Doe',
        email: email,
      );
      return user;
    });
  }
}
