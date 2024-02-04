import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    bottomAppBarTheme: BottomAppBarTheme(
      color: Theme.of(context).colorScheme.background,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Theme.of(context).colorScheme.background,
    ),
    buttonTheme: const ButtonThemeData(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange,
      background: Colors.black,
      surface: const Color(0xff191717),
      onBackground: Colors.white,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 32,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      titleLarge: const TextStyle(),
      titleMedium: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
      ),
    ),
  );
}
