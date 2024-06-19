import 'package:hello_flutter/data/remote/response/movie_list_response.dart'
    as response;
import 'package:hello_flutter/domain/entity/movie.dart';

class MovieMapper {
  static Movie mapResponseToDomain(response.Movie movie) {
    return Movie(
      movieId: movie.id?.toString() ?? '',
      title: movie.title ?? '',
      year: movie.year ?? 0,
      rating: movie.rating?.toDouble() ?? 0.0,
      poster: movie.smallCoverImage ?? '',
    );
  }
}
