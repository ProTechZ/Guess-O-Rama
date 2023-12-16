import 'package:flutter/material.dart';

class CustomButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var width = size.width; // 120
    var height = size.height; // 50

    path.moveTo(0, 0);

    // 2 top triangles
    var startingPoint = (width / 4).roundToDouble();
    path.lineTo(startingPoint, 0);
    path.lineTo(startingPoint -3, 8);
    path.lineTo(startingPoint + 6, 0);
    path.lineTo(startingPoint + 11, 5);
    path.lineTo(startingPoint + 13, 0);

    path.lineTo(width, 0);

    // side traingle
    path.lineTo(width, 10);
    path.lineTo(width - 10, 13);
    path.lineTo(width, 16);

    path.lineTo(width, height);

    // bottom triangle
    startingPoint = (width / 3 * 2).roundToDouble();
    path.lineTo(startingPoint, height);
    path.lineTo(startingPoint - 10, height - 4);
    path.lineTo(startingPoint - 7, height);

    path.lineTo(0, height);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
