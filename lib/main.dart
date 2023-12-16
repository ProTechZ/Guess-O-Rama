import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:guess_o_rama/screens/home_screen.dart';

// TODO change font
// TODO make bigger
// TODO fix button

final maxGuessProvider = StateProvider((ref) => 100);
final numOfGuessesListProvider = StateProvider<List<int>>((ref) => []);

// brown FFFAE0
// red EF3340
// yellow rgb(247,237,20)
// urple rgb(142,46,243)

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 255, 62),

);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 0, 255, 62),
);

void main() {
  runApp(
    // TODO: implement appbar theme
    ProviderScope(
      child: MaterialApp(
        title: 'Guess-O-RAMA',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            color: Colors.black,
            // backgroundColor: kColorScheme.onPrimaryContainer,
            // foregroundColor: kColorScheme.primaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 16,
                ),
              ),
        ),
        themeMode: ThemeMode.light,
        home: const HomeScreen(),
      ),
    ),
  );
}
