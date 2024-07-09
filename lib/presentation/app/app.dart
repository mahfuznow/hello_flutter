import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/app/app_module.dart';
import 'package:hello_flutter/presentation/base/screen_util/screen_util_builder.dart';
import 'package:hello_flutter/presentation/localization/generated/app_localizations.dart';
import 'package:hello_flutter/presentation/navigation/app_router.dart';
import 'package:hello_flutter/presentation/theme/dark_app_theme.dart';
import 'package:hello_flutter/presentation/theme/light_app_theme.dart';
import 'package:hello_flutter/util/app_logger.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppModule _appModule = AppModule();

  @override
  void initState() {
    super.initState();
    _appModule.injectDependencies();
  }

  @override
  void dispose() {
    _appModule.removeDependencies();
    super.dispose();
  }

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
