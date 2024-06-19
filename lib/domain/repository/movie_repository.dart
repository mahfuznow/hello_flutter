import 'package:hello_flutter/domain/model/movie_details_model.dart';
import 'package:hello_flutter/domain/model/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>?> getMovieList();

  Future<MovieDetailsModel?> getMovieDetails({required String movieId});

  Future<List<MovieModel>> searchMovies({required String query});
}
