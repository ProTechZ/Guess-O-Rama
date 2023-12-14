import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/screens/loading_screen.dart';
import 'package:guess_o_rama/widgets/logo.dart';
import 'package:guess_o_rama/screens/choose_max_guess_screen.dart';
import 'package:guess_o_rama/widgets/settings_dropdown.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxGuess = ref.watch(maxGuessProvider).toString();

    return Scaffold(
      appBar: AppBar(),
      drawer: const SettingsDropdown(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(width: 300, height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TrialsLoadingScreen(),
                ));
              },
              child: const Text('Trials'),
            ),
            Text(maxGuess),
          ],
        ),
      ),
    );
  }
}