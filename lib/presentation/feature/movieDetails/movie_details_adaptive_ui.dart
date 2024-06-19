import 'package:flutter/material.dart';
import 'package:hello_flutter/data/remote/api_client/movie_api_client.dart';
import 'package:hello_flutter/data/remote/api_service/movie_api_service_impl.dart';
import 'package:hello_flutter/data/repository/movie_repository_impl.dart';
import 'package:hello_flutter/presentation/base/base_adaptive_ui.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/movie_details_view_model.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/route/movie_details_argument.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/route/movie_details_route.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/screen/movie_details_mobile_landscape.dart';
import 'package:hello_flutter/presentation/feature/movieDetails/screen/movie_details_mobile_portrait.dart';

class MovieDetailsAdaptiveUi
    extends BaseAdaptiveUi<MovieDetailsArgument, MovieDetailsRoute> {
  const MovieDetailsAdaptiveUi({
    super.argument,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => MovieDetailsAdaptiveUiState();
}

class MovieDetailsAdaptiveUiState extends BaseAdaptiveUiState<
    MovieDetailsArgument,
    MovieDetailsRoute,
    MovieDetailsAdaptiveUi,
    MovieDetailsViewModel> {
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
