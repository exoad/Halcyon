import 'package:flutter/material.dart';

/// A toggle icon button that can switch between two icons when pressed.
/// However, it only does so when a parity check returns [true].
///
/// It inherently uses an [IconButton] from Flutter by default.
class H_ParityIconButton extends StatefulWidget {
  final void Function() onHit;
  final void Function()? onMiss;
  final Future<bool> Function(bool parity) parity;
  final Widget primaryIcon;
  final Widget secondaryIcon;
  final ButtonStyle? style;

  /// Creates a [H_ParityIconButton] widget.
  ///
  /// [style] - optional style for the [IconButton]
  ///
  /// [onMiss] - optional callback for when the parity check fails
  ///
  /// [parity] - the parity check function, called when the button is pressed
  ///
  /// [onHit] - the callback for when the parity check passes
  ///
  /// [primaryIcon] - the icon to display when the button is not pressed
  ///
  /// [secondaryIcon] - the icon to display when the button is pressed
  const H_ParityIconButton(
      {super.key,
      this.style,
      this.onMiss,
      required this.parity,
      required this.onHit,
      required this.primaryIcon,
      required this.secondaryIcon});

  @override
  State<H_ParityIconButton> createState() =>
      _H_ParityIconButtonState();
}

class _H_ParityIconButtonState extends State<H_ParityIconButton> {
  bool _parity = false;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        onPressed: () async {
          bool ask = await widget.parity(_parity);
          if (_parity && ask) {
            setState(() => _parity = !_parity);
            widget.onHit();
          } else {
            widget.onMiss
                ?.call(); // bruh, i feel like this could just be "widget?.onMiss();" but oh well
          }
        },
        style: widget.style ??
            IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory),
        icon: _parity ? widget.secondaryIcon : widget.primaryIcon);
  }
}

class H_ToggleIconButton extends StatefulWidget {
  final void Function(bool res) onPressed;
  final Widget primaryIcon;
  final Widget secondaryIcon;
  final ButtonStyle? style;

  const H_ToggleIconButton(
      {super.key,
      this.style,
      required this.onPressed,
      required this.primaryIcon,
      required this.secondaryIcon});

  @override
  State<H_ToggleIconButton> createState() =>
      _H_ToggleIconButtonState();
}

class _H_ToggleIconButtonState extends State<H_ToggleIconButton> {
  bool _parity = false;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        onPressed: () async {
          setState(() => _parity = !_parity);
          widget.onPressed.call(_parity);
        },
        style: widget.style ??
            IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory),
        icon: _parity ? widget.secondaryIcon : widget.primaryIcon);
  }
}
