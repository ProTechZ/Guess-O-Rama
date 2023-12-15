import 'package:flutter/material.dart';
import 'package:guess_o_rama/screens/choose_max_guess_screen.dart';
import 'package:guess_o_rama/screens/home_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            },
          ),
          ListTile(
            title: const Text('Change Limit'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ChooseNumberLimitScreen(),
              ));
            },
          ),
          ListTile(
            title: const Text('Show Tutorial'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ChooseNumberLimitScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
