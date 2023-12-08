import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: const Image(
        image: AssetImage('assets/Logo.png'),
      ),
    );
  }
}
