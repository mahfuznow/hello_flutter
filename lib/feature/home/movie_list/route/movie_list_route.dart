import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_route.dart';
import 'package:hello_flutter/feature/home/movie_list/movie_list_adaptive_ui.dart';
import 'package:hello_flutter/navigation/route_path.dart';

class MovieListRoute extends BaseRoute {
  @override
  RoutePath routePath = RoutePath.movieList;

  MovieListRoute({required super.arguments});

  @override
  MaterialPageRoute toMaterialPageRoute() {
    return MaterialPageRoute(builder: (_) => const MovieListAdaptiveUi());
  }
}
