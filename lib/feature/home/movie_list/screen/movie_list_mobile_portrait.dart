import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_ui_state.dart';
import 'package:hello_flutter/common/widget/network_image_view.dart';
import 'package:hello_flutter/data/model/movie_model.dart';
import 'package:hello_flutter/feature/home/movie_list/movie_list_view_model.dart';
import 'package:hello_flutter/values/dimens.dart';

class MovieListUiMobilePortrait extends StatefulWidget {
  final MovieListViewModel viewModel;

  const MovieListUiMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => MovieListUiMobilePortraitState();
}

class MovieListUiMobilePortraitState
    extends BaseUiState<MovieListUiMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.movies,
        builder: (context, value) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final movie = value[index];
              return _movieListView(movieModel: movie);
            },
          );
        },
      ),
    );
  }

  Widget _movieListView({
    required MovieModel movieModel,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: Dimens.dimen_3,
      margin: EdgeInsets.all(Dimens.dimen_8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: Dimens.dimen_8,
          horizontal: Dimens.dimen_16,
        ),
        leading: NetworkImageView(
          url: movieModel.poster,
          width: Dimens.dimen_50,
          fit: BoxFit.fitHeight,
        ),
        title: Text(
          movieModel.title,
          style: textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Release Year: ${movieModel.year}',
              style: textTheme.bodySmall,
            ),
            Text(
              'Rating: ${movieModel.rating} / 5',
              style: textTheme.bodySmall,
            ),
          ],
        ),
        onTap: () {
          widget.viewModel.onMovieItemClicked(movieModel);
        },
      ),
    );
  }
}
