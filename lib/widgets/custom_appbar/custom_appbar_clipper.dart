import 'package:flutter/material.dart';

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var width = size.width; // 411
    var height = size.height; // 74

    path.moveTo(0, 0);
    path.lineTo(0, height);
    path.lineTo(100, height);
    path.lineTo(110, height - 20);
    path.lineTo(width, height - 20);
    path.lineTo(width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
