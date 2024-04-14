import 'package:flutter/material.dart';
import 'package:halcyon/global.dart';

class H_AudioSecondaryControllerButtons extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color pressedColor;
  final double borderRadius;
  final void Function() onPressed;
  const H_AudioSecondaryControllerButtons(
      {super.key,
      required this.icon,
      this.borderRadius = HalcyonManager.kBorderRadius,
      required this.color,
      required this.pressedColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        onPressed: onPressed,
        icon: Icon(icon),
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: color,
          padding: const EdgeInsets.all(8.0),
        ));
  }
}
