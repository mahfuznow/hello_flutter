import 'package:flutter/material.dart';

import 'package:hello_flutter/base/base_ui_state.dart';
import 'package:hello_flutter/common/extension/context_ext.dart';
import 'package:hello_flutter/feature/home/home_view_model.dart';
import 'package:hello_flutter/main/flavors.dart';
import 'package:hello_flutter/values/dimens.dart';

class HomeUiMobilePortrait extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeUiMobilePortrait({
    required this.viewModel,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => HomeUiMobilePortraitState();
}

class HomeUiMobilePortraitState extends BaseUiState<HomeUiMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          F.getLocalizedAppTitleWithFlavor(context.localizations),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: Dimens.dimen_18,
              ),
        ),
        centerTitle: true,
      ),
      body: _homeBody(context),
    );
  }

  Widget _homeBody(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.userId,
      builder: (context, value) {
        return Center(
          child: Text(
            "Home, UserId: $value",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      },
    );
  }
}
