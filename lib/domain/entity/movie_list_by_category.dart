import 'package:hello_flutter/domain/entity/genre.dart';
import 'package:hello_flutter/domain/entity/movie.dart';

class MovieListByGenre {
  final Genre genre;
  final List<Movie> movies;

  MovieListByGenre({
    required this.genre,
    required this.movies,
  });
}
