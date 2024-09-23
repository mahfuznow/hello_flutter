import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_argument.dart';
import 'package:hello_flutter/presentation/base/base_route.dart';
import 'package:hello_flutter/presentation/navigation/route_path.dart';

class AppRouter {
  static final initialRoute = RoutePath.login.toPathString;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argObj = settings.arguments;

    BaseArgument? arguments;

    if (argObj is BaseArgument) {
      arguments = argObj;
    }

    final routePath = RoutePath.fromString(settings.name ?? '');
    final appRoute = routePath.getAppRoute(arguments: arguments);
    return appRoute.toMaterialPageRoute();
  }

  static void navigateTo(BuildContext context, BaseRoute appRoute) {
    Navigator.pushNamed(
      context,
      appRoute.routePath.toPathString,
      arguments: appRoute.arguments,
    );
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigateToAndClearStack(
      BuildContext context, BaseRoute appRoute) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      appRoute.routePath.toPathString,
      (route) => false,
      arguments: appRoute.arguments,
    );
  }

  static void pushReplacement(BuildContext context, BaseRoute appRoute) {
    Navigator.pushReplacementNamed(
      context,
      appRoute.routePath.toPathString,
      arguments: appRoute.arguments,
    );
  }
}
