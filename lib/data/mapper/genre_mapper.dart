import 'package:hello_flutter/domain/entity/genre.dart';

class GenreMapper {
  static Genre mapResponseToDomain(String genreString) {
    switch (genreString) {
      case 'Action':
        return Genre.action;
      case 'Adventure':
        return Genre.adventure;
      case 'Animation':
        return Genre.animation;
      case 'Biography':
        return Genre.biography;
      case 'Comedy':
        return Genre.comedy;
      case 'Crime':
        return Genre.crime;
      case 'Drama':
        return Genre.drama;
      case 'Family':
        return Genre.family;
      case 'Fantasy':
        return Genre.fantasy;
      case 'History':
        return Genre.history;
      case 'Horror':
        return Genre.horror;
      case 'Music':
        return Genre.music;
      case 'Mystery':
        return Genre.mystery;
      case 'Romance':
        return Genre.romance;
      case 'Sci-Fi':
        return Genre.sciFi;
      case 'Sport':
        return Genre.sport;
      case 'Thriller':
        return Genre.thriller;
      case 'War':
        return Genre.war;
      case 'Western':
        return Genre.western;
      default:
        return Genre.action;
    }
  }
}
