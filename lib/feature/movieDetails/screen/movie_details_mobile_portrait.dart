import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_ui_state.dart';
import 'package:hello_flutter/data/model/movie_details_model.dart';
import 'package:hello_flutter/feature/movieDetails/movie_details_view_model.dart';

class MovieDetailsUiMobilePortrait extends StatefulWidget {
  final MovieDetailsViewModel viewModel;

  const MovieDetailsUiMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => MovieDetailsUiMobilePortraitState();
}

class MovieDetailsUiMobilePortraitState
    extends BaseUiState<MovieDetailsUiMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.movie,
        builder: (context, value) {
          return value != null
              ? _movieDetailsView(movieDetailsModel: value)
              : const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _movieDetailsView({
    required MovieDetailsModel movieDetailsModel,
  }) {
    return Column(
      children: [
        Image.network(
          movieDetailsModel.imageUrl,
          fit: BoxFit.fitHeight,
        ),
        Text(movieDetailsModel.title),
        Text('Release Year: ${movieDetailsModel.releaseYear}'),
        Text('Rating: ${movieDetailsModel.rating} / 5'),
      ],
    );
  }
}
