import 'package:flutter/material.dart';
import 'package:guess_o_rama/appbar.dart';
import 'package:guess_o_rama/home_screen.dart';
import 'package:guess_o_rama/tutorial_card/tutorial_card.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              
              child: const Image(
                image: AssetImage('assets/Logo.png'),
              ),
            ),
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
