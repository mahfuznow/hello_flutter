import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/common/extension/context_ext.dart';

class LoginEmailTextField extends StatelessWidget {
  final TextEditingController emailTextEditingController;
  final String? errorText;

  const LoginEmailTextField({
    required this.emailTextEditingController,
    required this.errorText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailTextEditingController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        border: const OutlineInputBorder(),
        labelText:
            context.localizations.login__login_form__email_field_label_text,
        hintText: context
            .localizations.login__login_form__email_field_placeholder_text,
        errorText: errorText,
      ),
    );
  }
}
