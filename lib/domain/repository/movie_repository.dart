import 'package:hello_flutter/domain/entity/genre.dart';
import 'package:hello_flutter/domain/entity/movie.dart';
import 'package:hello_flutter/domain/entity/movie_details.dart';
import 'package:hello_flutter/domain/entity/movie_list_by_category.dart';

abstract class MovieRepository {
  Future<List<Movie>?> getMovieList();

  Future<List<Movie>> searchMovies({required String query});

  Future<List<Movie>?> getMovieListByGenre({required Genre genre});

  Future<MovieDetails?> getMovieDetails({required String movieId});

  Future<List<MovieListByGenre>> getMoviesGroupedByGenre();
}
