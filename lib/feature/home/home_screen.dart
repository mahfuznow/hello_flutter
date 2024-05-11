import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_adaptive_ui.dart';
import 'package:hello_flutter/feature/home/home_view_model.dart';
import 'package:hello_flutter/feature/home/route/home_argument.dart';
import 'package:hello_flutter/feature/home/screen/home_ui_mobile_potrait.dart';

class HomeAdaptiveUi extends BaseAdaptiveUi<HomeArgument> {
  const HomeAdaptiveUi({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState
    extends BaseAdaptiveUiState<HomeArgument, HomeAdaptiveUi, HomeViewModel> {
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
    return Column(
      children: [
        const Text("Home Screen"),
        ElevatedButton(
          onPressed: () {
            viewModel.onClickBack();
          },
          child: const Text("Back"),
        ),
      ],
    );
  }

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return HomeUiMobilePortrait(viewModel: viewModel);
  }
}
