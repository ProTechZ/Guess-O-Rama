import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/widgets/custom_appbar/custom_appbar.dart';
import 'package:guess_o_rama/widgets/logo.dart';
import 'package:guess_o_rama/screens/loading_screen.dart';
import 'package:guess_o_rama/widgets/custom_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxGuess = ref.watch(maxGuessProvider).toString();

    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(width: 300, height: 150),
            SizedBox(
              height: 100,
            ),
            CustomButton(
              onPressed: () => Utils().moveToNewScreen(
                context,
                const LoadingScreen(),
              ),
              text: 'Play!',
            ),
            Text(maxGuess),
          ],
        ),
      ),
    );
  }
}
