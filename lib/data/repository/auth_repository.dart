import 'package:hello_flutter/data/model/app_user_session.dart';

abstract class AuthRepository {
  Future<AppUserSession> login({
    required String email,
    required String password,
  });

  Future<AppUserSession> register({
    required String email,
    required String password,
  });

  Future<bool> logout();

  Future<bool> isLoggedIn();
}
