import 'package:domain/model/app_language.dart';
import 'package:domain/model/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/base/base_ui_state.dart';
import 'package:hello_flutter/presentation/common/extension/context_ext.dart';
import 'package:hello_flutter/presentation/feature/settings/screen/widgets/theme_settings.dart';
import 'package:hello_flutter/presentation/feature/settings/settings_view_model.dart';

class SettingsMobilePortrait extends StatefulWidget {
  final SettingsViewModel viewModel;

  const SettingsMobilePortrait({required this.viewModel, super.key});

  @override
  State<StatefulWidget> createState() => SettingsMobilePortraitState();
}

class SettingsMobilePortraitState extends BaseUiState<SettingsMobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ThemeSettings(viewModel: widget.viewModel),
            valueListenableBuilder(
              listenable: widget.viewModel.appViewModel.selectedLanguage,
              builder: (context, selectedLanguage) {
                return Card(
                  child: ExpansionTile(
                    title: Text(
                      context.localizations.language,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    children: [
                      _buildLanguageOption(
                        AppLanguage.en,
                        context.localizations.en,
                        selectedLanguage,
                      ),
                      _buildLanguageOption(
                        AppLanguage.nb,
                        context.localizations.nb,
                        selectedLanguage,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    AppLanguage language,
    String label,
    AppLanguage selectedLanguage,
  ) {
    return ListTile(
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      trailing: Radio<AppLanguage>(
        value: language,
        groupValue: selectedLanguage,
        onChanged: (AppLanguage? value) {
          widget.viewModel.onLanguageChanged(
            value,
          );
        },
      ),
    );
  }
}
