import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final 

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text('Well Done'),
            Text('You took ')
          ],
        ));
  }
}
