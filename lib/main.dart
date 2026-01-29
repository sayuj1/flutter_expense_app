import 'package:flutter/material.dart';
import 'package:expense_tracker_app/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 58, 183, 108),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 58, 183, 108),
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardThemeData().copyWith(
          // color: const Color.fromARGB(255, 255, 255, 255),
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
            // foregroundColor: Colors.white,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 43, 200, 106),
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor:
              kColorScheme.onPrimaryContainer, // dark version of color
          foregroundColor:
              kColorScheme.primaryContainer, // light version of color
        ),
        cardTheme: const CardThemeData().copyWith(
          // color: const Color.fromARGB(255, 255, 255, 255),
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            // color: Color.fromARGB(255, 9, 164, 9),
            color: kColorScheme.onSecondaryContainer,
            fontSize: 18,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
            // foregroundColor: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.system, // default
      home: Expenses(),
    ),
  );
}
