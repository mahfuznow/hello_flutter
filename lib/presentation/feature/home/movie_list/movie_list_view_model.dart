import 'package:flutter/foundation.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service_impl.dart';
import 'package:hello_flutter/data/repository/movie_repository_impl.dart';
import 'package:hello_flutter/domain/model/movie_model.dart';
import 'package:hello_flutter/domain/repository/movie_repository.dart';
import 'package:hello_flutter/presentation/base/base_viewmodel.dart';
import 'package:hello_flutter/presentation/feature/home/movie_list/route/movie_list_argument.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/route/movie_details_argument.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/route/movie_details_route.dart';
import 'package:hello_flutter/util/value_notifier_list.dart';

class MovieListViewModel extends BaseViewModel<MovieListArgument> {
  static MovieListViewModel singleton = MovieListViewModel(
    movieRepository: MovieRepositoryImpl(
      movieApiService: MovieApiServiceImpl(
        apiClient: MovieApiClient(),
      ),
    ),
  );

  final MovieRepository movieRepository;

  final ValueNotifierList<MovieModel> _movies = ValueNotifierList([]);

  ValueListenable<List<MovieModel>> get movies => _movies;

  MovieListViewModel({required this.movieRepository});

  @override
  void onViewReady({MovieListArgument? argument}) {
    super.onViewReady();
    if (_movies.value.isEmpty) {
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

  void onClickedFavorite(MovieModel movie) {
    _movies.updateItem(
      movie,
      movie.copyWith(isFavorite: !movie.isFavorite),
    );
  }
}
