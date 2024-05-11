import 'package:hello_flutter/data/model/movie.dart';
import 'package:hello_flutter/data/model/movie_details.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovieList();

  Future<MovieDetails> getMovieDetails(int movieId);

  Future<List<Movie>> searchMovies(String query);
}
