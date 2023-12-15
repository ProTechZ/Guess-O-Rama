import 'package:flutter/material.dart';

class TutorialCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var width = size.width;
    var height = size.height;
    
    path.moveTo(0, 0); // A
    path.lineTo(100, 0); // B
    path.lineTo(150, 40); // C
    path.lineTo(width - 10, 40); // D
    path.quadraticBezierTo(width, 40, width, 50);  // curves the top-right corner
    path.lineTo(width, height); // E
    path.lineTo(0, height); // F
    path.lineTo(0, 0); // A
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
