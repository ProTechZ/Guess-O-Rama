import 'package:flutter/material.dart';
import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

class ChooseNumberLimitScreen extends StatefulWidget {
  const ChooseNumberLimitScreen({super.key});

  @override
  State<ChooseNumberLimitScreen> createState() =>
      _ChooseNumberLimitScreenState();
}

class _ChooseNumberLimitScreenState extends State<ChooseNumberLimitScreen> {
  final _maxGuessController = TextEditingController();

  void saveMaxGuess(int maxGuess) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('maxGuess', maxGuess);
  }

  void _submitNumLimit() {
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
      saveMaxGuess(maxGuess);
      Utils().moveToNewScreen(context, const HomeScreen());
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
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(
                  'Your current upper limit is ${snapshot.data}',
                  style: textTheme.bodyMedium,
                );
              }
              return const Text('');
            },
            future: Utils().getMaxGuess(),
          ),
          const SizedBox(height: 20),
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
            onPressed: _submitNumLimit,
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
