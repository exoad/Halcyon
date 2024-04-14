import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class H_TimeseekSlider extends StatefulWidget {
  final void Function(double value) onChanged;
  final double initialValue;
  final Color activeColor;
  final Color inactiveColor;
  final Color secondaryActiveColor;
  final Color thumbColor;
  final Color thumbGlowColor;
  final Color activeHoveredColor;

  /// [onChanged] is called when the user is selecting a new value (the value supplied on the closed interval 0 to 1)
  const H_TimeseekSlider(
      {super.key,
      required this.onChanged,
      this.initialValue = 0.0,
      this.thumbGlowColor = Colors.transparent,
      Color? activeHoveredColor,
      required this.activeColor,
      required this.inactiveColor,
      required this.secondaryActiveColor,
      required this.thumbColor})
      : activeHoveredColor = activeHoveredColor ?? activeColor;

  @override
  State<H_TimeseekSlider> createState() => _H_TimeseekSliderState();
}

class _H_TimeseekSliderState extends State<H_TimeseekSlider> {
  late double _sliderValue;
  bool _hovered = false;
  bool _sliderEngaged =
      false; // since we use a crossfade to show and hide the thumb, there is a little flashing glitch, this helps to mitigate it when the user drags off of the slider

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent _) =>
          setState(() => _hovered = true),
      onExit: (PointerExitEvent _) =>
          setState(() => _hovered = false),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 220),
        crossFadeState: _hovered || _sliderEngaged
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: SizedBox(
            height: 40,
            child: SliderTheme(
              data: SliderThemeData(
                  overlayColor: widget.thumbGlowColor),
              child: Slider(
                onChangeStart: (double _) =>
                    setState(() => _sliderEngaged = true),
                onChangeEnd: (double _) =>
                    setState(() => _sliderEngaged = false),
                value: _sliderValue,
                activeColor: widget.activeHoveredColor,
                inactiveColor: widget.inactiveColor,
                secondaryActiveColor: widget.secondaryActiveColor,
                thumbColor: widget.thumbColor,
                allowedInteraction: SliderInteraction.tapAndSlide,
                overlayColor: MaterialStatePropertyAll<Color>(
                    widget.thumbGlowColor),
                onChanged: (double value) {
                  setState(() => _sliderValue = value);
                  widget.onChanged(value);
                },
              ),
            )),
        secondChild: SizedBox(
            height: 40,
            child: SliderTheme(
              data: SliderThemeData(
                  overlayColor: widget.thumbGlowColor,
                  thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0)),
              child: Slider(
                onChangeStart: (double _) =>
                    setState(() => _sliderEngaged = true),
                onChangeEnd: (double _) =>
                    setState(() => _sliderEngaged = false),
                value: _sliderValue,
                activeColor: widget.activeColor,
                inactiveColor: widget.inactiveColor,
                secondaryActiveColor: widget.secondaryActiveColor,
                thumbColor: widget.thumbColor,
                allowedInteraction: SliderInteraction.tapAndSlide,
                overlayColor: MaterialStatePropertyAll<Color>(
                    widget.thumbGlowColor),
                onChanged: (double value) {
                  setState(() => _sliderValue = value);
                  widget.onChanged(value);
                },
              ),
            )),
      ),
    );
  }
}
