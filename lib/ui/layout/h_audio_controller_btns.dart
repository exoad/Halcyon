import 'package:flutter/material.dart';
import 'package:halcyon/extern/string.dart';
import 'package:halcyon/ux/laf_config/halcyon_laf_config.dart';

class H_AudioPrimaryControllerButtons extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color pressedColor;
  final void Function() onPressed;
  const H_AudioPrimaryControllerButtons(
      {super.key,
      required this.icon,
      required this.color,
      required this.pressedColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        visualDensity: VisualDensity.comfortable,
        onPressed: onPressed,
        icon: Icon(icon,
            size: HalcyonLaFConfig
                .instance.playbackController_PrimaryButtonSize
                .toDouble()),
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  HalcyonLaFConfig.instance.general_BorderRadius)),
          backgroundColor: HalcyonLaFConfig
              .instance
              .playbackController_PrimaryButtonBackgroundColor
              .coerceToColorObj,
          foregroundColor: HalcyonLaFConfig
              .instance
              .playbackController_PrimaryButtonForegroundColor
              .coerceToColorObj,
          padding: const EdgeInsets.all(8.0),
        ));
  }
}

class H_AudioSecondaryControllerButtons extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  const H_AudioSecondaryControllerButtons(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        visualDensity: VisualDensity.comfortable,
        onPressed: onPressed,
        icon: Icon(icon,
            size: HalcyonLaFConfig
                .instance.playbackController_SecondaryButtonSize
                .toDouble()),
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  HalcyonLaFConfig.instance.general_BorderRadius)),
          backgroundColor: HalcyonLaFConfig
              .instance
              .playbackController_SecondaryButtonBackgroundColor
              .coerceToColorObj,
          foregroundColor: HalcyonLaFConfig
              .instance
              .playbackController_SecondaryButtonForegroundColor
              .coerceToColorObj,
          padding: const EdgeInsets.all(8.0),
        ));
  }
}
