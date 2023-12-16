import 'package:flutter/material.dart';
import 'package:guess_o_rama/widgets/custom_appbar/custom_appbar_clipper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar() : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppBarClipper(),
      child: Container(
        decoration: BoxDecoration(color: Colors.red),
        // foregroundDecoration: BoxDecoration(color: Colors.red),
        child: AppBar(
          surfaceTintColor: Colors.black,
          title: Text(
            'hi',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          
        ),
      ),
    );
  }
}
