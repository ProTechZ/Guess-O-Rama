import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';

class ChooseNumberLimitScreen extends ConsumerStatefulWidget {
  const ChooseNumberLimitScreen({super.key});

  @override
  ConsumerState<ChooseNumberLimitScreen> createState() =>
      _ChooseNumberLimitScreenState();
}

class _ChooseNumberLimitScreenState
    extends ConsumerState<ChooseNumberLimitScreen> {
  final _maxGuessController = TextEditingController();

  void _submitNumLimit(WidgetRef ref) {
    var maxGuess = int.tryParse(_maxGuessController.text);

    if (maxGuess == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          padding: EdgeInsets.all(10),
          content: Text('Please enter a value first.'),
        ),
      );
    } else {
      FocusManager.instance.primaryFocus?.unfocus();

      ref.read(maxGuessProvider.notifier).state = maxGuess;

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DefaultScreen(
      body: Column(
        children: [
          Text(
            'If you want to change the number you are guessing upto, enter the number and press OK.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Your current upper limit is ${Utils().getMaxGuess(ref)}',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 30),
          TextField(
            style: textTheme.labelMedium,
            controller: _maxGuessController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text(
                'Change Upper Limit',
                style: textTheme.labelSmall,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            onPressed: () => _submitNumLimit(ref),
            icon: const Icon(Icons.check),
            label: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Text('OK', style: textTheme.displayMedium),
            ),
          ),
        ],
      ),
    );
  }
}
