import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/screens/trials_loading_screen.dart';
import 'package:guess_o_rama/widgets/logo.dart';
import 'package:guess_o_rama/screens/choose_num_limit_screen.dart';
import 'package:guess_o_rama/widgets/settings_dropdown.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxNumToGuess = ref.watch(maxNumToGuessProvider).toString();

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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChooseNumberLimitScreen(),
                ));
              },
              child: const Text('Time'),
            ),
            Text(maxNumToGuess),
          ],
        ),
      ),
    );
  }
}
