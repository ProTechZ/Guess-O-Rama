import 'package:flutter/material.dart';
import 'package:guess_o_rama/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/widgets/side_drawer.dart';

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

    // TODO: make choosing the upper lim a slider
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
      drawer: const SideDrawer(),
      body: Column(
        children: [
          TextField(
            controller: _maxGuessController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Upper Limit'),
            ),
          ),
          ElevatedButton(
            onPressed: () => _submitNumLimit(ref),
            child: const Text('OK'),
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pop(), // go back to home screen
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
