import 'package:flutter/material.dart';
import 'package:guess_o_rama/widgets/custom_button/custom_button_clipper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 50,
    this.width = 120,
  });

  final void Function() onPressed;
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomButtonClipper(),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
