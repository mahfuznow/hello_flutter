import 'package:hello_flutter/base/base_argument.dart';
import 'package:hello_flutter/base/base_route.dart';
import 'package:hello_flutter/feature/auth/login/route/login_route.dart';
import 'package:hello_flutter/feature/home/route/home_argument.dart';
import 'package:hello_flutter/feature/home/route/home_route.dart';
import 'package:hello_flutter/navigation/unknown_page_route.dart';

enum RoutePath {
  unknown,
  login,
  home;

  static RoutePath fromString(String path) {
    switch (path) {
      case '/login':
        return RoutePath.login;
      case '/home':
        return RoutePath.home;
      default:
        return RoutePath.unknown;
    }
  }

  String get toPathString {
    switch (this) {
      case RoutePath.login:
        return '/login';
      case RoutePath.home:
        return '/home';
      default:
        return '';
    }
  }

  BaseRoute getAppRoute({BaseArgument? arguments}) {
    switch (this) {
      case RoutePath.login:
        return LoginRoute(arguments: arguments);
      case RoutePath.home:
        return HomeRoute(arguments: arguments as HomeArgument);
      default:
        return UnknownRoute(arguments: arguments);
    }
  }
}
