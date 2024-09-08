import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/feature/settings/screen/settings_mobile_portrait.dart';

class SettingsMobileLandscape extends SettingsMobilePortrait {
  const SettingsMobileLandscape({required super.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SettingsMobileLandscapeState();
}

class SettingsMobileLandscapeState extends SettingsMobilePortraitState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: valueListenableBuilder(
        listenable: widget.viewModel.appViewModel.selectedThemeMode,
        builder: (context, value) {
          return InkWell(
            child: Text('Accounts: $value'),
            onTap: () {},
          );
        },
      ),
    );
  }
}
