import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/widgets/custom_button.dart';

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
      Utils().showErrorDialog(
        context,
        "My title",
        "Please enter a value for the upper limit",
      );
    } else {
      ref.read(maxGuessProvider.notifier).state = maxGuess;

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _maxGuessController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Upper Limit'),
            ),
          ),
          CustomButton(
            onPressed: () => _submitNumLimit(ref),
            text: 'OK',
          ),
          CustomButton(
            onPressed: () => Navigator.of(context).pop(),
            text: 'Back',
          ),
        ],
      ),
    );
  }
}
