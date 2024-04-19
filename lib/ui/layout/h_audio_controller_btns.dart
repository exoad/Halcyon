import 'package:flutter/material.dart';
import 'package:halcyon/extern/string.dart';
import 'package:halcyon/ux/laf_config/halcyon_laf_config.dart';

class H_AudioPrimaryControllerButtons extends StatefulWidget {
  final IconData icon;
  final void Function() onPressed;
  const H_AudioPrimaryControllerButtons(
      {super.key, required this.icon, required this.onPressed});

  @override
  State<H_AudioPrimaryControllerButtons> createState() =>
      _H_AudioPrimaryControllerButtonsState();
}

class _H_AudioPrimaryControllerButtonsState
    extends State<H_AudioPrimaryControllerButtons> {
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        onPressed: widget.onPressed,
        icon: Icon(widget.icon,
            size: HalcyonLaFConfig
                .instance.playbackController_PrimaryButtonSize
                .toDouble()),
        style: IconButton.styleFrom(
          elevation: HalcyonLaFConfig.instance.general_Elevation,
          backgroundColor: HalcyonLaFConfig
              .instance
              .playbackController_PrimaryButtonBackgroundColor
              .coerceToColorObj,
          foregroundColor: HalcyonLaFConfig
              .instance
              .playbackController_PrimaryButtonForegroundColor
              .coerceToColorObj,
          splashFactory: NoSplash.splashFactory,
          padding: const EdgeInsets.all(8.0),
        ));
  }
}

class H_AudioSecondaryControllerButtons extends StatefulWidget {
  final IconData icon;
  final void Function() onPressed;
  const H_AudioSecondaryControllerButtons(
      {super.key, required this.icon, required this.onPressed});

  @override
  State<H_AudioSecondaryControllerButtons> createState() =>
      _H_AudioSecondaryControllerButtonsState();
}

class _H_AudioSecondaryControllerButtonsState
    extends State<H_AudioSecondaryControllerButtons> {
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        onPressed: widget.onPressed,
        icon: Icon(widget.icon,
            size: HalcyonLaFConfig
                .instance.playbackController_SecondaryButtonSize
                .toDouble()),
        style: IconButton.styleFrom(
          elevation: HalcyonLaFConfig.instance.general_Elevation,
          backgroundColor: HalcyonLaFConfig
              .instance
              .playbackController_SecondaryButtonBackgroundColor
              .coerceToColorObj,
          foregroundColor: HalcyonLaFConfig
              .instance
              .playbackController_SecondaryButtonForegroundColor
              .coerceToColorObj,
          splashFactory: NoSplash.splashFactory,
          padding: const EdgeInsets.all(8.0),
        ));
  }
}
