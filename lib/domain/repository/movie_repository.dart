import 'package:hello_flutter/domain/entity/movie.dart';
import 'package:hello_flutter/domain/entity/movie_details.dart';

abstract class MovieRepository {
  Future<List<Movie>?> getMovieList();

  Future<MovieDetails?> getMovieDetails({required String movieId});

  Future<List<Movie>> searchMovies({required String query});
}
