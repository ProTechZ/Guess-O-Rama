import 'package:flutter/material.dart';

class ChooseNumberLimitScreen extends StatelessWidget {
  ChooseNumberLimitScreen({super.key});
  final _numLimitController = TextEditingController();

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
          )
        ],
      ),
    );
  }
}
