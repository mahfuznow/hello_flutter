import 'dart:ui';

import 'package:hello_flutter/presentation/theme/app_theme.dart';
import 'package:hello_flutter/presentation/theme/color/app_colors.dart';
import 'package:hello_flutter/presentation/theme/color/dark_app_colors.dart';

class DarkAppTheme extends AppTheme {
  @override
  AppColors appColors = DarkAppColors();

  @override
  Brightness brightness = Brightness.dark;
}
