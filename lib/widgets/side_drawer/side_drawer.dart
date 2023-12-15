import 'package:flutter/material.dart';
import 'package:guess_o_rama/screens/home_screen.dart';
import 'package:guess_o_rama/screens/choose_max_guess_screen.dart';
import 'package:guess_o_rama/widgets/side_drawer/side_drawer_clipper.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SideDrawerClipper(),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.zero,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text('Drawer Header'),
              ),
            ),
            MyListTile(
              text: 'Home',
              icon: Icons.home_filled,
              goToScreen: HomeScreen(),
            ),
            MyListTile(
              text: 'Change Limit',
              icon: Icons.change_circle,
              goToScreen: ChooseNumberLimitScreen(),
            ),
            MyListTile(
              text: 'Show Tutorial',
              icon: Icons.help,
              goToScreen: HomeScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.goToScreen,
  });

  final String text;
  final IconData icon;
  final Widget goToScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        leading: Icon(icon),
        title: Text(text),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => goToScreen,
          ));
        },
      ),
    );
  }
}
