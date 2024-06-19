import 'package:hello_flutter/data/remote/response/movie_details_response.dart';

class MovieDetailsModel {
  final String title;
  final String fullDescription;
  final String imageUrl;
  final double rating;
  final List<GenreModel> genres;
  final int releaseYear;

  MovieDetailsModel({
    required this.title,
    required this.fullDescription,
    required this.imageUrl,
    required this.rating,
    required this.genres,
    required this.releaseYear,
  });

  factory MovieDetailsModel.fromMovieDetailsResponse({required Movie movieDetails}) {
    return MovieDetailsModel(
      title: movieDetails.title ?? '',
      fullDescription: movieDetails.descriptionFull ?? '',
      imageUrl: movieDetails.backgroundImageOriginal ?? '',
      rating: movieDetails.rating?.toDouble() ?? 0.0,
      genres:
          movieDetails.genres?.map((e) => GenreModel.fromResponseString(e)).toList() ??
              [],
      releaseYear: movieDetails.year ?? 0,
    );
  }
}

enum GenreModel {
  action,
  adventure,
  animation,
  biography,
  comedy,
  crime,
  drama,
  family,
  fantasy,
  history,
  horror,
  music,
  mystery,
  romance,
  sciFi,
  sport,
  thriller,
  war,
  western;

  factory GenreModel.fromResponseString(String genre) {
    switch (genre) {
      case 'Action':
        return GenreModel.action;
      case 'Adventure':
        return GenreModel.adventure;
      case 'Animation':
        return GenreModel.animation;
      case 'Biography':
        return GenreModel.biography;
      case 'Comedy':
        return GenreModel.comedy;
      case 'Crime':
        return GenreModel.crime;
      case 'Drama':
        return GenreModel.drama;
      case 'Family':
        return GenreModel.family;
      case 'Fantasy':
        return GenreModel.fantasy;
      case 'History':
        return GenreModel.history;
      case 'Horror':
        return GenreModel.horror;
      case 'Music':
        return GenreModel.music;
      case 'Mystery':
        return GenreModel.mystery;
      case 'Romance':
        return GenreModel.romance;
      case 'Sci-Fi':
        return GenreModel.sciFi;
      case 'Sport':
        return GenreModel.sport;
      case 'Thriller':
        return GenreModel.thriller;
      case 'War':
        return GenreModel.war;
      case 'Western':
        return GenreModel.western;
      default:
        return GenreModel.action;
    }
  }
}
