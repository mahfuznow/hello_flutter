import 'package:hello_flutter/base/base_argument.dart';
import 'package:hello_flutter/base/base_route.dart';
import 'package:hello_flutter/feature/auth/login/route/login_route.dart';
import 'package:hello_flutter/feature/home/movie_list/route/movie_list_route.dart';
import 'package:hello_flutter/feature/home/route/home_argument.dart';
import 'package:hello_flutter/feature/home/route/home_route.dart';
import 'package:hello_flutter/navigation/unknown_page_route.dart';

enum RoutePath {
  unknown,
  login,
  home,
  movieList,
  movieSearch,
  movieBookmark,
  setting,
  movieDetails;

  static RoutePath fromString(String? path) {
    switch (path) {
      case '/login':
        return RoutePath.login;
      case '/home':
        return RoutePath.home;
      case '/movieList':
        return RoutePath.movieList;
      case '/movieSearch':
        return RoutePath.movieSearch;
      case '/movieBookmark':
        return RoutePath.movieBookmark;
      case '/setting':
        return RoutePath.setting;
      case '/movieDetails':
        return RoutePath.movieDetails;
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
      case RoutePath.movieList:
        return '/movieList';
      case RoutePath.movieSearch:
        return '/movieSearch';
      case RoutePath.movieBookmark:
        return '/movieBookmark';
      case RoutePath.setting:
        return '/setting';
      case RoutePath.movieDetails:
        return '/movieDetails';
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
        case RoutePath.movieList:
        return MovieListRoute(arguments: arguments);
      default:
        return UnknownRoute(arguments: arguments);
    }
  }
}
