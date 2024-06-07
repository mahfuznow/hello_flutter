import 'package:flutter/foundation.dart';
import 'package:hello_flutter/base/base_viewmodel.dart';
import 'package:hello_flutter/data/model/movie_model.dart';
import 'package:hello_flutter/data/repository/movie_repository.dart';
import 'package:hello_flutter/feature/home/movie_list/route/movie_list_argument.dart';

class MovieListViewModel extends BaseViewModel<MovieListArgument> {
  final MovieRepository movieRepository;

  final ValueNotifier<List<MovieModel>> _movies = ValueNotifier([]);
  ValueListenable<List<MovieModel>> get movies => _movies;

  MovieListViewModel({required this.movieRepository});

  @override
  void onViewReady({MovieListArgument? argument}) {
    super.onViewReady();
    fetchMovies();
  }

  void fetchMovies() async {
    List<MovieModel>? movies =
        await loadData(() => movieRepository.getMovieList());
    if (movies != null && movies.isNotEmpty) {
      _movies.value = movies;
    }
  }
}
