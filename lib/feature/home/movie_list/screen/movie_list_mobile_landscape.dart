import 'package:flutter/material.dart';
import 'package:hello_flutter/feature/home/movie_list/screen/movie_list_mobile_portrait.dart';

class MovieListUiMobileLandscape extends MovieListUiMobilePortrait {
  const MovieListUiMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => MovieListUiMobileLandscapeState();
}

class MovieListUiMobileLandscapeState extends MovieListUiMobilePortraitState {}
