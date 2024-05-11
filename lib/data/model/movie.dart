class Movie {
  final String title;
  final String director;
  final int year;

  Movie({
    required this.title,
    required this.director,
    required this.year,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      director: json['director'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'director': director,
      'year': year,
    };
  }
}