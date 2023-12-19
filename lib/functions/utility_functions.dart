import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void moveToNewScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  Future<int> getMaxGuess() async {
    final SharedPreferences prefs = await _prefs;
    final maxGuess = prefs.getInt('maxGuess') ?? 100;

    return maxGuess;
  }

  Future<int> createNumToGuess() async {
    final maxGuess = await getMaxGuess();
    return Random().nextInt(maxGuess);
  }
}
