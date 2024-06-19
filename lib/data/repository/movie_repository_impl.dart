import 'package:hello_flutter/data/mapper/movie_details_mapper.dart';
import 'package:hello_flutter/data/mapper/movie_mapper.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service.dart';
import 'package:hello_flutter/domain/entity/movie.dart';
import 'package:hello_flutter/domain/entity/movie_details.dart';
import 'package:hello_flutter/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService movieApiService;

  MovieRepositoryImpl({required this.movieApiService});

  @override
  Future<List<Movie>?> getMovieList() async {
    final movieListResponse = await movieApiService.getMovies();
    return movieListResponse.data?.movies
        ?.map((e) => MovieMapper.mapResponseToDomain(e))
        .toList();
  }

  @override
  Future<MovieDetails?> getMovieDetails({required String movieId}) async {
    final movieDetailsResponse =
        await movieApiService.getMovieDetails(movieId: movieId);
    if (movieDetailsResponse.data?.movie != null) {
      return MovieDetailsMapper.mapResponseToDomain(
        movieDetailsResponse.data!.movie!,
      );
    }
    return null;
  }

  @override
  Future<List<Movie>> searchMovies({required String query}) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
