import 'package:flutter/material.dart';
import 'package:guess_o_rama/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrialsLoadingScreen extends ConsumerWidget {
  const TrialsLoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
              'Your limit is ${ref.read(lowerNumLimitProvider.notifier).state}'),
        ],
      ),
    );
  }
}
