import 'package:flutter/material.dart';
import 'package:guess_o_rama/home_screen.dart';
import 'package:guess_o_rama/logo.dart';
import 'package:guess_o_rama/tutorial_card/tutorial_card.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TutorialCard(),
            const Logo(width: 300, height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              child: const Text('Play!'),
            ),
          ],
        ),
      ),
    );
  }
}
