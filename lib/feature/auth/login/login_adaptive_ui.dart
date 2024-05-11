import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_adaptive_ui.dart';
import 'package:hello_flutter/feature/auth/login/login_view_model.dart';
import 'package:hello_flutter/feature/auth/login/route/login_argument.dart';
import 'package:hello_flutter/feature/auth/login/screen/login_ui_mobile_landscape.dart';
import 'package:hello_flutter/feature/auth/login/screen/login_ui_mobile_portrait.dart';

class LoginAdaptiveUi extends BaseAdaptiveUi<LoginArgument> {
  const LoginAdaptiveUi({super.key});

  @override
  State<StatefulWidget> createState() => LoginAdaptiveUiState();
}

class LoginAdaptiveUiState extends BaseAdaptiveUiState<LoginArgument,
    LoginAdaptiveUi, LoginViewModel> {
  @override
  LoginViewModel viewModel = LoginViewModel();

  @override
  StatefulWidget mobileLandscapeContents(BuildContext context) {
    return LoginUiMobileLandscape(viewModel: viewModel);
  }

  @override
  StatefulWidget mobilePortraitContents(BuildContext context) {
    return LoginUiMobilePortrait(viewModel: viewModel);
  }
}
