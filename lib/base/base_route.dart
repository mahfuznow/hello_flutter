import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_argument.dart';
import 'package:hello_flutter/navigation/route_path.dart';

abstract class BaseRoute {
  abstract RoutePath routePath;
  BaseArgument? arguments;

  BaseRoute({this.arguments});

  MaterialPageRoute toMaterialPageRoute();
}
