import 'package:flutter/material.dart';
import 'package:guess_o_rama/widgets/logo.dart';
import 'package:guess_o_rama/screens/choose_num_limit_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(width: 300, height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  ChooseNumberLimitScreen(),
                ));
              },
              child: const Text('Trials'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  ChooseNumberLimitScreen(),
                ));
              },
              child: const Text('Time'),
            ),
          ],
        ),
      ),
    );
  }
}
