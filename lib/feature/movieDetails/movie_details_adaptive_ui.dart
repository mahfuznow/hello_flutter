import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_adaptive_ui.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service_impl.dart';
import 'package:hello_flutter/data/repository/movie_repository_impl.dart';
import 'package:hello_flutter/feature/movieDetails/movie_details_view_model.dart';
import 'package:hello_flutter/feature/movieDetails/route/movie_details_argument.dart';
import 'package:hello_flutter/feature/movieDetails/screen/movie_details_mobile_landscape.dart';
import 'package:hello_flutter/feature/movieDetails/screen/movie_details_mobile_portrait.dart';

class MovieDetailsAdaptiveUi extends BaseAdaptiveUi<MovieDetailsArgument> {

  const MovieDetailsAdaptiveUi({
    super.argument,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => MovieDetailsAdaptiveUiState();
}

class MovieDetailsAdaptiveUiState extends BaseAdaptiveUiState<
    MovieDetailsArgument, MovieDetailsAdaptiveUi, MovieDetailsViewModel> {
  @override
  MovieDetailsViewModel viewModel = MovieDetailsViewModel(
    movieRepository: MovieRepositoryImpl(
      movieApiService: MovieApiServiceImpl(
        apiClient: MovieApiClient(),
      ),
    ),
  );

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return MovieDetailsUiMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return MovieDetailsUiMobileLandscape(viewModel: viewModel);
  }
}
