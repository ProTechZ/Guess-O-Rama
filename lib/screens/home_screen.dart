import 'package:flutter/material.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';
import 'package:guess_o_rama/screens/loading_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/screens/choose_max_guess_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      useAppbar: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 400,
              height: 200,
              child: Image(image: AssetImage('assets/Logo.png')),
            ),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Utils().moveToNewScreen(
                    context,
                    const LoadingScreen(),
                  ),
                  icon: const Icon(Icons.play_arrow, size: 40),
                  label: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      'PLAY',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButtonTheme.of(context).style!.copyWith(
                        backgroundColor: MaterialStatePropertyAll(
                          kColorScheme.onPrimary,
                        ),
                      ),
                  onPressed: () => Utils().moveToNewScreen(
                    context,
                    const ChooseNumberLimitScreen(),
                  ),
                  icon: Icon(
                    Icons.edit,
                    size: 40,
                    color: kColorScheme.primary,
                  ),
                  label: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      'EDIT',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: kColorScheme.primary),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
