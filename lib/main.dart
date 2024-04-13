import 'package:flutter/material.dart';
import 'package:halcyon/debug.dart';
import 'package:halcyon/global.dart';
import 'package:window_manager/window_manager.dart';
import 'package:halcyon/ui/h_app_entry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await Halcyon.instance.ensureInitialized();
  windowManager.waitUntilReadyToShow(
      const WindowOptions(
        size: Size(560, 760),
        minimumSize: Size(560, 760),
        title: "Halcyon",
        alwaysOnTop: true,
        titleBarStyle: TitleBarStyle.normal,
      ), () async {
    await windowManager.setAlignment(Alignment.center, animate: true);
    await windowManager.show();
    await Future<void>.delayed(const Duration(milliseconds: 500),
        () => windowManager.setAlwaysOnTop(false));
  });
  Halcyon.instance.audioEngine.init().then((_) {
    Debugger.LOG
        .info("SoLoud initialized ; also using automatic cleanup");
    runApp(const HalcyonAppEntry());
  });
}
