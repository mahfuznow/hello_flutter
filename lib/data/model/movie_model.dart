import 'package:hello_flutter/data/remote/response/movie_list_response.dart';

class MovieModel {
  final String movieId;
  final String title;
  final int year;
  final double rating;
  final String poster;
  final bool isFavorite;

  MovieModel({
    required this.movieId,
    required this.title,
    required this.year,
    required this.rating,
    required this.poster,
    this.isFavorite = false,
  });

  factory MovieModel.fromResponseMovie(Movie movie) {
    return MovieModel(
      movieId: movie.id?.toString() ?? '',
      title: movie.title ?? '',
      year: movie.year ?? 0,
      rating: movie.rating?.toDouble() ?? 0.0,
      poster: movie.smallCoverImage ?? '',
    );
  }

  MovieModel copyWith({
    String? movieId,
    String? title,
    int? year,
    double? rating,
    String? poster,
    bool? isFavorite,
  }) {
    return MovieModel(
      movieId: movieId ?? this.movieId,
      title: title ?? this.title,
      year: year ?? this.year,
      rating: rating ?? this.rating,
      poster: poster ?? this.poster,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
