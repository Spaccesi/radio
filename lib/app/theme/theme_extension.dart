import 'package:flutter/material.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppThemeX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
}
