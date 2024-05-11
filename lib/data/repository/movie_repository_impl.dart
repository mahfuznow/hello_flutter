import 'package:hello_flutter/data/model/movie.dart';
import 'package:hello_flutter/data/model/movie_details.dart';
import 'package:hello_flutter/data/remote/movie_api_client.dart';
import 'package:hello_flutter/data/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiClient movieApiClient;

  MovieRepositoryImpl(this.movieApiClient);

  @override
  Future<List<Movie>> getMovieList() {
    // TODO: implement getMovieList
    throw UnimplementedError();
  }

  @override
  Future<MovieDetails> getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
