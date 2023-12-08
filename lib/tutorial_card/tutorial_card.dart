import 'package:flutter/material.dart';
import 'package:guess_o_rama/tutorial_card/tutorial_clipper.dart';

class TutorialCard extends StatelessWidget {
  const TutorialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TutorialCardClipper(),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey,
        ),
        width: 300,
        height: 450,
        child: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
