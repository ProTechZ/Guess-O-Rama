import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/screens/home_screen.dart';

class ChooseNumberLimitScreen extends ConsumerStatefulWidget {
  const ChooseNumberLimitScreen({super.key});

  @override
  ConsumerState<ChooseNumberLimitScreen> createState() =>
      _ChooseNumberLimitScreenState();
}

class _ChooseNumberLimitScreenState
    extends ConsumerState<ChooseNumberLimitScreen> {
  final _lowerNumLimitController = TextEditingController();
  final _upperNumLimitController = TextEditingController();

  void _submitNumLimit(WidgetRef ref) {
    var lowerNumLimit = int.tryParse(_lowerNumLimitController.text);
    var upperNumLimit = int.tryParse(_upperNumLimitController.text);

    if (lowerNumLimit == null || upperNumLimit == null) {
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
      ref.read(lowerNumLimitProvider.notifier).state = lowerNumLimit;
      ref.read(upperNumLimitProvider.notifier).state = upperNumLimit;
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
            controller: _lowerNumLimitController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Lower Limit'),
            ),
          ),
          TextField(
            controller: _upperNumLimitController,
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
