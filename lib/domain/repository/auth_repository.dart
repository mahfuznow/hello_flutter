import 'package:hello_flutter/domain/entity/user_session.dart';

abstract class AuthRepository {
  Future<UserSession> login({
    required String email,
    required String password,
  });

  Future<UserSession> register({
    required String email,
    required String password,
  });

  Future<bool> logout();

  Future<bool> isLoggedIn();
}
