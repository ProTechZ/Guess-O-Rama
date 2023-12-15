import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/screens/loading_screen.dart';
import 'package:guess_o_rama/widgets/logo.dart';
import 'package:guess_o_rama/widgets/side_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxGuess = ref.watch(maxGuessProvider).toString();

    return Scaffold(
      appBar: AppBar(),
      drawer: const SideDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(width: 300, height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GameLoadingScreen(),
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
