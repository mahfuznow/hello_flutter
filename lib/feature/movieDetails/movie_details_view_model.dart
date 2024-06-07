import 'package:flutter/foundation.dart';
import 'package:hello_flutter/base/base_viewmodel.dart';
import 'package:hello_flutter/data/model/movie_details_model.dart';
import 'package:hello_flutter/data/repository/movie_repository.dart';
import 'package:hello_flutter/feature/movieDetails/route/movie_details_argument.dart';

class MovieDetailsViewModel extends BaseViewModel<MovieDetailsArgument> {
  final MovieRepository movieRepository;

  final ValueNotifier<MovieDetailsModel?> _movie = ValueNotifier(null);

  ValueListenable<MovieDetailsModel?> get movie => _movie;

  MovieDetailsViewModel({required this.movieRepository});

  @override
  void onViewReady({MovieDetailsArgument? argument}) {
    super.onViewReady();
    fetchMovie(movieId: argument!.movieId);
  }

  void fetchMovie({required String movieId}) async {
    MovieDetailsModel? movie =
        await loadData(() => movieRepository.getMovieDetails(movieId: movieId));
    if (movie != null) {
      _movie.value = movie;
    }
  }
}
