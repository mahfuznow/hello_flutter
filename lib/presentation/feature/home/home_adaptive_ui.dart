import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_adaptive_ui.dart';
import 'package:hello_flutter/presentation/feature/home/home_view_model.dart';
import 'package:hello_flutter/presentation/feature/home/route/home_argument.dart';
import 'package:hello_flutter/presentation/feature/home/route/home_route.dart';
import 'package:hello_flutter/presentation/feature/home/screen/home_ui_mobile_landscape.dart';
import 'package:hello_flutter/presentation/feature/home/screen/home_ui_mobile_potrait.dart';

class HomeAdaptiveUi extends BaseAdaptiveUi<HomeArgument, HomeRoute> {
  const HomeAdaptiveUi({
    super.argument,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => HomeAdaptiveUiState();
}

class HomeAdaptiveUiState extends BaseAdaptiveUiState<HomeArgument, HomeRoute,
    HomeAdaptiveUi, HomeViewModel> {
  @override
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return HomeUiMobilePortrait(viewModel: viewModel);
  }

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return HomeUiMobileLandscape(viewModel: viewModel);
  }
}
