import 'package:hello_flutter/data/model/movie_model.dart';
import 'package:hello_flutter/data/model/movie_details_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>?> getMovieList();

  Future<MovieDetailsModel> getMovieDetails(int movieId);

  Future<List<MovieModel>> searchMovies(String query);
}
