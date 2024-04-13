import 'package:flutter/material.dart';
import 'package:halcyon/ui/h_grabber_dragger.dart';

class H_VerticalAppLayout extends StatefulWidget {
  const H_VerticalAppLayout({super.key});

  @override
  State<H_VerticalAppLayout> createState() =>
      _H_VerticalAppLayoutState();
}

class _H_VerticalAppLayoutState extends State<H_VerticalAppLayout> {
  late double _sheetPosition;
  static const int _dragSensitivity = 780;

  @override
  void initState() {
    super.initState();
    _sheetPosition = 0.9;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollableSheet(
          initialChildSize: _sheetPosition,
          builder:
              (BuildContext context, ScrollController controller) {
            return Column(children: <Widget>[
              const Expanded(child: H_VTopLayer()),
              H_Grabber(
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _sheetPosition -=
                        details.delta.dy / _dragSensitivity;
                    if (_sheetPosition < 0.25) {
                      _sheetPosition = 0.25;
                    }
                    if (_sheetPosition > 1.0) {
                      _sheetPosition = 1.0;
                    }
                  });
                },
                isOnDesktopAndWeb: true,
              ),
              const Expanded(child: H_VBottomLayer())
            ]);
          }),
    );
  }
}

class H_VTopLayer extends StatelessWidget {
  const H_VTopLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}

class H_VBottomLayer extends StatelessWidget {
  const H_VBottomLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.pink);
  }
}
