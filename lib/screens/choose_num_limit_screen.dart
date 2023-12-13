import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/screens/start_screen.dart';

class ChooseNumberLimitScreen extends ConsumerStatefulWidget {
  const ChooseNumberLimitScreen({super.key});

  @override
  ConsumerState<ChooseNumberLimitScreen> createState() =>
      _ChooseNumberLimitScreenState();
}

class _ChooseNumberLimitScreenState
    extends ConsumerState<ChooseNumberLimitScreen> {
  final _numLimitController = TextEditingController();

  void _submitNumLimit(WidgetRef ref) {
    var numLimit = int.tryParse(_numLimitController.text);

    if (numLimit == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("My title"),
          content: const Text('this is my msg'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    } else {
      ref.read(numLimitProvider.notifier).state = numLimit;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const StartScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _numLimitController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Limit'),
            ),
          ),
          ElevatedButton(
            onPressed: () => _submitNumLimit(ref),
            child: const Text('OK'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(), // go back to home screen
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
