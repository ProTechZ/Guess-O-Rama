import 'package:flutter/material.dart';
import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({
    super.key,
    this.appBarActions,
    this.useAppBar = true,
    required this.screen,
  });

  final Widget screen;
  final bool useAppBar;
  final List<Widget>? appBarActions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: useAppBar
          ? AppBar(
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () => Utils().moveToNewScreen(
                  context,
                  const HomeScreen(),
                ),
                child: const SizedBox(
                  width: 90,
                  height: 45,
                  child: Image(
                    image: AssetImage('assets/Logo_bold.png'),
                  ),
                ),
              ),
              actions: appBarActions ?? [],
              centerTitle: true,
            )
          : null,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.secondary,
              const Color.fromARGB(255, 75, 195, 99),
            ],
          ),
        ),
        child: screen,
      ),
    );
  }
}
