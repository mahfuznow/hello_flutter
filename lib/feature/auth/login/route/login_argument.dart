import 'package:hello_flutter/base/base_argument.dart';

class LoginArgument extends BaseArgument {
  final String? email;
  final String? password;

  LoginArgument({this.email, this.password});
}
