import 'package:flutter/foundation.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service_impl.dart';
import 'package:hello_flutter/data/repository/movie_repository_impl.dart';
import 'package:hello_flutter/domain/entity/movie.dart';
import 'package:hello_flutter/domain/entity/movie_list_by_category.dart';
import 'package:hello_flutter/domain/repository/movie_repository.dart';
import 'package:hello_flutter/presentation/base/base_viewmodel.dart';
import 'package:hello_flutter/presentation/feature/home/movie_list/route/movie_list_argument.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/route/movie_details_argument.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/route/movie_details_route.dart';
import 'package:hello_flutter/presentation/util/value_notifier_list.dart';

class MovieListViewModel extends BaseViewModel<MovieListArgument> {
  static MovieListViewModel singleton = MovieListViewModel(
    movieRepository: MovieRepositoryImpl(
      movieApiService: MovieApiServiceImpl(
        apiClient: MovieApiClient(),
      ),
    ),
  );

  final MovieRepository movieRepository;

  final ValueNotifierList<Movie> _movies = ValueNotifierList([]);

  ValueListenable<List<Movie>> get movies => _movies;

  final ValueNotifierList<MovieListByGenre> _moviesGroupedByGenre =
      ValueNotifierList([]);

  ValueListenable<List<MovieListByGenre>> get moviesGroupedByGenre =>
      _moviesGroupedByGenre;

  MovieListViewModel({required this.movieRepository});

  @override
  void onViewReady({MovieListArgument? argument}) {
    super.onViewReady();
    if (_movies.value.isEmpty) {
      fetchMovies();
    }
    if (_moviesGroupedByGenre.value.isEmpty) {
      fetchMoviesGroupedByGenre();
    }
  }

  void fetchMovies() async {
    List<Movie>? movies = await loadData(() => movieRepository.getMovieList());
    if (movies != null && movies.isNotEmpty) {
      _movies.value = movies;
    }
  }

  void fetchMoviesGroupedByGenre() async {
    List<MovieListByGenre> allGenreMovies =
        await loadData(() => movieRepository.getMoviesGroupedByGenre());
    if (allGenreMovies.isNotEmpty) {
      _moviesGroupedByGenre.value = allGenreMovies;
    }
  }

  void onMovieItemClicked(Movie movie) {
    navigateToScreen(
      destination: MovieDetailsRoute(
        arguments: MovieDetailsArgument(movieId: movie.movieId),
      ),
    );
  }

  void onClickedFavorite(Movie movie) {
    _movies.updateItem(
      movie,
      movie.copyWith(isFavorite: !movie.isFavorite),
    );
  }
}
