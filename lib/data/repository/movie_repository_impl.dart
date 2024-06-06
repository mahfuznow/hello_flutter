import 'package:hello_flutter/data/model/movie_model.dart';
import 'package:hello_flutter/data/model/movie_details_model.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service.dart';
import 'package:hello_flutter/data/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService movieApiService;

  MovieRepositoryImpl({required this.movieApiService});

  @override
  Future<List<MovieModel>?> getMovieList() async {
    final movieListResponse = await movieApiService.getMovies();
    return movieListResponse.data?.movies?.map((e) => MovieModel.fromResponseMovie(e)).toList();
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
