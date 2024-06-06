import 'package:hello_flutter/data/remote/response/movie_details_response.dart';
import 'package:hello_flutter/data/remote/response/movie_list_response.dart';

abstract class MovieApiService {
  Future<MovieListResponse> getMovies();

  Future<MovieDetailsResponse> getMovieDetails(int movieId);
}
