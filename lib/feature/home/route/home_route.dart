import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_route.dart';
import 'package:hello_flutter/feature/home/home_adaptive_ui.dart';
import 'package:hello_flutter/feature/home/route/home_argument.dart';
import 'package:hello_flutter/navigation/route_path.dart';

class HomeRoute extends BaseRoute {
  @override
  RoutePath routePath = RoutePath.home;

  HomeRoute({required HomeArgument arguments}) : super(arguments: arguments);

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(
      builder: (_) => HomeAdaptiveUi(argument: arguments as HomeArgument),
    );
  }
}
