import 'package:flutter/foundation.dart';
import 'package:hello_flutter/base/base_viewmodel.dart';
import 'package:hello_flutter/data/model/movie_model.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service_impl.dart';
import 'package:hello_flutter/data/repository/movie_repository.dart';
import 'package:hello_flutter/data/repository/movie_repository_impl.dart';
import 'package:hello_flutter/feature/home/movie_list/route/movie_list_argument.dart';
import 'package:hello_flutter/feature/movieDetails/route/movie_details_argument.dart';
import 'package:hello_flutter/feature/movieDetails/route/movie_details_route.dart';

class MovieListViewModel extends BaseViewModel<MovieListArgument> {

  static MovieListViewModel singleton = MovieListViewModel(
    movieRepository: MovieRepositoryImpl(
      movieApiService: MovieApiServiceImpl(
        apiClient: MovieApiClient(),
      ),
    ),
  );

  final MovieRepository movieRepository;

  final ValueNotifier<List<MovieModel>> _movies = ValueNotifier([]);

  ValueListenable<List<MovieModel>> get movies => _movies;

  MovieListViewModel({required this.movieRepository});

  @override
  void onViewReady({MovieListArgument? argument}) {
    super.onViewReady();
    if(_movies.value.isEmpty) {
      fetchMovies();
    }
  }

  void fetchMovies() async {
    List<MovieModel>? movies =
        await loadData(() => movieRepository.getMovieList());
    if (movies != null && movies.isNotEmpty) {
      _movies.value = movies;
    }
  }

  void onMovieItemClicked(MovieModel movie) {
    navigateToScreen(
      destination: MovieDetailsRoute(
        arguments: MovieDetailsArgument(movieId: movie.movieId),
      ),
    );
  }
}
