import 'package:flutter/material.dart';
import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final maxGuessProvider = StateProvider((ref) => 100);
final numOfGuessesListProvider = StateProvider<List<int>>((ref) => []);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
