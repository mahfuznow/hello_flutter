import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_route.dart';
import 'package:hello_flutter/feature/auth/login/login_adaptive_ui.dart';
import 'package:hello_flutter/feature/auth/login/route/login_argument.dart';
import 'package:hello_flutter/navigation/route_path.dart';

class LoginRoute extends BaseRoute<LoginArgument> {
  @override
  RoutePath routePath = RoutePath.login;

  LoginRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(builder: (_) => const LoginAdaptiveUi());
  }
}
