
import 'package:flutter/material.dart';
import 'package:hello_flutter/base/base_ui_state.dart';
import 'package:hello_flutter/common/extension/context_ext.dart';
import 'package:hello_flutter/common/widget/overflow_scroll_view.dart';
import 'package:hello_flutter/common/widget/primary_button.dart';
import 'package:hello_flutter/feature/auth/login/login_view_model.dart';
import 'package:hello_flutter/feature/auth/login/widgets/login_email_text_field.dart';
import 'package:hello_flutter/feature/auth/login/widgets/login_password_text_field.dart';
import 'package:hello_flutter/values/dimens.dart';

class LoginUiMobilePortrait extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginUiMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => LoginUiMobilePortraitState();
}

class LoginUiMobilePortraitState extends BaseUiState<LoginUiMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.login__title_text),
      ),
      body: overflowScrollView(
        child: loginForm(context),
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          logoView(context),
          SizedBox(height: Dimens.dimen_40),
          emailAndPasswordFields(context),
          SizedBox(height: Dimens.dimen_20),
          loginButton(context),
          forgotPasswordButton(context),
          SizedBox(height: Dimens.dimen_100),
        ],
      ),
    );
  }

  Widget logoView(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/app_logo.png",
          width: Dimens.dimen_100,
          height: Dimens.dimen_100,
        ),
        SizedBox(height: Dimens.dimen_10),
        Text(
          context.localizations.app_name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        )
      ],
    );
  }

  Widget emailAndPasswordFields(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        emailField(context),
        SizedBox(height: Dimens.dimen_10),
        passwordField(context),
      ],
    );
  }

  Widget emailField(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.emailTextEditingController,
      builder: (context, value) => LoginEmailTextField(
        emailTextEditingController: widget.viewModel.emailTextEditingController,
        errorText: widget.viewModel.getEmailError(context),
      ),
    );
  }

  Widget passwordField(BuildContext context) {
    return valueListenableBuilder(
      listenable: widget.viewModel.passwordTextEditingController,
      builder: (context, value) => LoginPasswordTextField(
        passwordTextEditingController:
            widget.viewModel.passwordTextEditingController,
        errorText: widget.viewModel.getPasswordError(context),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return PrimaryButton(
      label: context.localizations.login__login_btn_text,
      onPressed: () => widget.viewModel.onLoginButtonClicked(),
    );
  }

  Widget forgotPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () => widget.viewModel.onForgotPasswordButtonClicked(),
      child: Text(
        context.localizations.login__forgot_password_text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      onLongPress: () => widget.viewModel.onForgotPasswordButtonLongPressed(),
    );
  }
}
