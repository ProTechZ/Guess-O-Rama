import 'package:flutter/material.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:guess_o_rama/screens/playing_screen.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({
    super.key,
    this.useRestart = false,
    this.useAppbar = true,
    required this.body,
  });

  final Widget body;
  final bool useAppbar;
  final bool useRestart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: useAppbar
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
              actions: useRestart
                  ? [
                      IconButton(
                        icon: const Icon(
                          Icons.restart_alt,
                          color: Colors.white,
                        ),
                        onPressed: () => Utils().moveToNewScreen(
                          context,
                          const PlayingScreen(),
                        ),
                      )
                    ]
                  : null,
              centerTitle: true,
            )
          : null,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kGreen, const Color.fromARGB(255, 75, 195, 99)],
          ),
        ),
        child: body,
      ),
    );
  }
}
