import 'package:flutter/material.dart';
import 'package:guess_o_rama/widgets/default_button.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';
import 'package:guess_o_rama/screens/loading_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/screens/choose_max_guess_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DefaultScreen(
      useAppBar: false,
      screen: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 400,
              height: 200,
              child: Image(image: AssetImage('assets/Logo.png')),
            ),
            const SizedBox(height: 50),
            DefaultButton(
              onPressed: () => Utils().moveToNewScreen(
                context,
                const LoadingScreen(),
              ),
              text: 'PLAY',
              textStyle: textTheme.displayLarge!,
              icon: Icons.play_arrow,
              iconSize: 40,
            ),
            const SizedBox(height: 20),
            DefaultButton(
              secondary: true,
              onPressed: () => Utils().moveToNewScreen(
                context,
                const ChooseNumberLimitScreen(),
              ),
              text: 'EDIT',
              textStyle: textTheme.displayLarge!,
              icon: Icons.edit,
              iconSize: 40,
            )
          ],
        ),
      ),
    );
  }
}
