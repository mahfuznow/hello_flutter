import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_adaptive_ui.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service_impl.dart';
import 'package:hello_flutter/data/repository/movie_repository_impl.dart';
import 'package:hello_flutter/feature/home/movie_list/movie_list_view_model.dart';
import 'package:hello_flutter/feature/home/movie_list/route/movie_list_argument.dart';
import 'package:hello_flutter/feature/home/movie_list/screen/movie_list_mobile_landscape.dart';
import 'package:hello_flutter/feature/home/movie_list/screen/movie_list_mobile_portrait.dart';

class MovieListAdaptiveUi extends BaseAdaptiveUi<MovieListArgument> {
  const MovieListAdaptiveUi({super.key});

  @override
  State<StatefulWidget> createState() => MovieListAdaptiveUiState();
}

class MovieListAdaptiveUiState extends BaseAdaptiveUiState<MovieListArgument,
    MovieListAdaptiveUi, MovieListViewModel> {
  @override
  MovieListViewModel viewModel = MovieListViewModel(
    movieRepository: MovieRepositoryImpl(
        movieApiService: MovieApiServiceImpl(
      apiClient: MovieApiClient(),
    )),
  );

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return MovieListUiMobileLandscape(viewModel: viewModel);
  }

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return MovieListUiMobilePortrait(viewModel: viewModel);
  }
}