import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/widgets/logo.dart';
import 'package:guess_o_rama/screens/choose_num_limit_screen.dart';
import 'package:guess_o_rama/widgets/settings_dropdown.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numLimit = ref.watch(numLimitProvider).toString();

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
                  builder: (context) => ChooseNumberLimitScreen(),
                ));
              },
              child: const Text('Trials'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChooseNumberLimitScreen(),
                ));
              },
              child: const Text('Time'),
            ),
            Text(numLimit),
          ],
        ),
      ),
    );
  }
}
