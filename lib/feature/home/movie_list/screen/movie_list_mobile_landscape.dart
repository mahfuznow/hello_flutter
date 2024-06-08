import 'package:flutter/material.dart';
import 'package:hello_flutter/common/widget/network_image_view.dart';
import 'package:hello_flutter/common/widget/rating_view.dart';
import 'package:hello_flutter/data/model/movie_model.dart';
import 'package:hello_flutter/feature/home/movie_list/screen/movie_list_mobile_portrait.dart';
import 'package:hello_flutter/values/dimens.dart';

class MovieListUiMobileLandscape extends MovieListUiMobilePortrait {
  const MovieListUiMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => MovieListUiMobileLandscapeState();
}

class MovieListUiMobileLandscapeState extends MovieListUiMobilePortraitState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.movies,
        builder: (context, value) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2, //width / height
            ),
            itemCount: value.length,
            itemBuilder: (context, index) {
              final movie = value[index];
              return _movieListItemView(movieModel: movie);
            },
            shrinkWrap: true,
          );
        },
      ),
    );
  }

  Widget _movieListItemView({
    required MovieModel movieModel,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: Dimens.dimen_1,
      margin: EdgeInsets.all(Dimens.dimen_8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NetworkImageView(
            url: movieModel.poster,
            height: Dimens.dimen_150,
            fit: BoxFit.cover,
          ),
          Text(
            movieModel.title,
            style: textTheme.titleMedium,
          ),
          Padding(
            padding: EdgeInsets.all(Dimens.dimen_8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${movieModel.year}',
                  style: textTheme.labelMedium,
                ),
                SizedBox(height: Dimens.dimen_2),
                RatingView(
                  rating: movieModel.rating,
                  maxRating: 10,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
