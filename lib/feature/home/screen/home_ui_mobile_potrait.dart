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
  final PageController _pageController = PageController();

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
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _homeBody(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) => widget.viewModel.onPageChanged(index),
      physics: const NeverScrollableScrollPhysics(),
      children: widget.viewModel.navigationItems.map((e) => e.page).toList(),
    );
  }

  Widget _bottomNavigation() {
    return valueListenableBuilder(
      listenable: widget.viewModel.currentPageIndex,
      builder: (context, value) {
        return NavigationBar(
          elevation: Dimens.dimen_10,
          surfaceTintColor: Theme.of(context).colorScheme.primary,
          selectedIndex: value,
          onDestinationSelected: (index) {
            _pageController.jumpToPage(index);
            widget.viewModel.onNavigationItemClicked(index);
          },
          destinations: widget.viewModel.navigationItems
              .map(
                (e) => NavigationDestination(
                  icon: Icon(e.icon),
                  selectedIcon: Icon(e.selectedIcon),
                  label: e.label,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
