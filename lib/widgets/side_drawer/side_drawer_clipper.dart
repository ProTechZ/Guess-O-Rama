import 'package:flutter/material.dart';

class SideDrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var width = size.width; // 304
    var height = size.height; // 890

    path.moveTo(0, 0);

    // slant
    path.lineTo(140, 0);
    path.lineTo(170, 30);

    // first top triangle
    path.lineTo(250, 30);
    path.lineTo(253, 40);
    path.lineTo(256, 30);

    // top-right curved corner
    path.lineTo(width - 10, 30);
    path.quadraticBezierTo(width, 30, width, 40);

    // drawer header triangle
    path.lineTo(width, 50);
    path.lineTo(width - 7, 63);
    path.lineTo(width, 60);

    // first list-tile triangle
    path.lineTo(width, 125);
    path.lineTo(width - 7, 130);
    path.lineTo(width, 135);

    // second list-tile traingle
    path.lineTo(width, 185);
    path.lineTo(width - 7, 190);
    path.lineTo(width, 195);

    // third list-tile traingle
    path.lineTo(width, 245);
    path.lineTo(width - 7, 250);
    path.lineTo(width, 255);

    // first and second side triangle
    path.lineTo(width, 500);
    path.lineTo(width - 10, 505);
    path.lineTo(width, 510);
    path.lineTo(width - 5, 515);
    path.lineTo(width, 520);

    // third triangle
    path.lineTo(width, 650);
    path.lineTo(width - 7, 660);
    path.lineTo(width, 657);

    // bottom-right corner
    path.lineTo(width, height - 9);
    path.lineTo(width - 8, height - 16);
    path.lineTo(width - 7, height - 10);
    path.lineTo(width - 17, height - 14);
    path.lineTo(width - 10, height);

    path.lineTo(0, height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
