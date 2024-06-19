import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hello_flutter/presentation/app/app_viewmodel.dart';
import 'package:hello_flutter/presentation/base/screen_util/screen_util_builder.dart';
import 'package:hello_flutter/presentation/navigation/app_router.dart';
import 'package:hello_flutter/presentation/theme/dark_app_theme.dart';
import 'package:hello_flutter/presentation/theme/light_app_theme.dart';
import 'package:hello_flutter/util/app_logger.dart';

class MyApp extends StatelessWidget {
  final AppViewModel viewModel = AppViewModel();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentLocal = Platform.localeName;
    AppLogger.d("current locale: $currentLocal");

    return MaterialApp(
      theme: LightAppTheme().getThemeData(),
      darkTheme: DarkAppTheme().getThemeData(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return ScreenUtilBuilder(child: child);
      },
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
