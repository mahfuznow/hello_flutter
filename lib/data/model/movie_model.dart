import 'package:hello_flutter/data/remote/response/movie_list_response.dart';

class MovieModel {
  final String title;
  final int year;
  final double rating;
  final String poster;

  MovieModel({
    required this.title,
    required this.year,
    required this.rating,
    required this.poster,
  });

  factory MovieModel.fromResponseMovie(Movie movie) {
    return MovieModel(
      title: movie.title ?? '',
      year: movie.year ?? 0,
      rating: movie.rating?.toDouble() ?? 0.0,
      poster: movie.largeCoverImage ?? '',
    );
  }
}