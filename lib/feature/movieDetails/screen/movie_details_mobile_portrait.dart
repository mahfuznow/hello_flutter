import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_ui_state.dart';
import 'package:hello_flutter/data/model/movie_details_model.dart';
import 'package:hello_flutter/feature/movieDetails/movie_details_view_model.dart';
import 'package:hello_flutter/values/dimens.dart';

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMoviePoster(movieDetailsModel.imageUrl),
          _buildMovieInfo(movieDetailsModel)
        ],
      ),
    );
  }

  Widget _buildMoviePoster(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      height: 250,
    );
  }

  Widget _buildMovieInfo(MovieDetailsModel movieDetailsModel) {
    return Padding(
      padding: EdgeInsets.all(Dimens.dimen_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title of the movie
          Text(
            movieDetailsModel.title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: Dimens.dimen_8),

          // Release year
          Text(
            'Release Year: ${movieDetailsModel.releaseYear}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          SizedBox(height: Dimens.dimen_8),

          // Rating
          _buildRatingStars(movieDetailsModel.rating),

          SizedBox(height: Dimens.dimen_8),

          //Genre
          _buildGenres(movieDetailsModel.genres),

          SizedBox(height: Dimens.dimen_8),

          // Full description
          Text(
            movieDetailsModel.fullDescription,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  // Function to build star icons based on rating
  Widget _buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      IconData starIcon;
      if (i * 2 <= rating) {
        starIcon = Icons.star;
      } else if (i * 2 > rating && i - rating < 1) {
        starIcon = Icons.star_half;
      } else {
        starIcon = Icons.star_border;
      }
      stars.add(Icon(
        starIcon,
        color: Colors.amber,
      ));
    }
    return Row(children: stars);
  }

  Widget _buildGenres(List<GenreModel> genres) {
    return Wrap(
      children: genres
          .map((e) => Padding(
                padding: EdgeInsets.only(right: Dimens.dimen_4),
                child: Chip(
                  label: Text(e.toString().split('.').last),
                ),
              ))
          .toList(),
    );
  }
}
