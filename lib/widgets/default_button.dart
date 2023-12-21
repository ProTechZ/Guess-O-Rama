import 'package:flutter/material.dart';
import 'package:guess_o_rama/main.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textStyle,
    required this.icon,
    this.iconSize = 25,
    this.secondary = false,
  });

  final void Function() onPressed;
  final String text;
  final TextStyle textStyle;
  final IconData icon;
  final double iconSize;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final elevatedBtnStyle = Theme.of(context).elevatedButtonTheme.style;

    if (secondary) {
      return ElevatedButton.icon(
        style: elevatedBtnStyle!.copyWith(
          backgroundColor: MaterialStatePropertyAll(
            kColorScheme.onPrimary,
          ),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: iconSize,
          color: colorScheme.primary,
        ),
        label: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            text,
            style: textStyle.copyWith(color: kColorScheme.primary),
          ),
        ),
      );
    } else {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: iconSize),
        label: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Text(text, style: textStyle),
        ),
      );
    }
  }
}
