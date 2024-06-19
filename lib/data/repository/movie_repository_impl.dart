import 'package:hello_flutter/data/remote/api_service/movie_api_service.dart';
import 'package:hello_flutter/domain/model/movie_details_model.dart';
import 'package:hello_flutter/domain/model/movie_model.dart';
import 'package:hello_flutter/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService movieApiService;

  MovieRepositoryImpl({required this.movieApiService});

  @override
  Future<List<MovieModel>?> getMovieList() async {
    final movieListResponse = await movieApiService.getMovies();
    return movieListResponse.data?.movies
        ?.map((e) => MovieModel.fromResponseMovie(e))
        .toList();
  }

  @override
  Future<MovieDetailsModel?> getMovieDetails({required String movieId}) async {
    final movieDetailsResponse =
        await movieApiService.getMovieDetails(movieId: movieId);
    if (movieDetailsResponse.data?.movie != null) {
      return MovieDetailsModel.fromMovieDetailsResponse(
          movieDetails: movieDetailsResponse.data!.movie!);
    }
    return null;
  }

  @override
  Future<List<MovieModel>> searchMovies({required String query}) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
