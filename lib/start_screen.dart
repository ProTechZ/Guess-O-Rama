import 'package:flutter/material.dart';
import 'package:guess_o_rama/home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('GUESS-O-RAMA'),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: const Text('Play!'),
        )
      ],
    );
  }
}
