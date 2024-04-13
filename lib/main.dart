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
        size: Size(800, 600),
        title: "Halcyon",
        titleBarStyle: TitleBarStyle.normal,
      ),
      () async => await windowManager.show());
  Halcyon.instance.audioEngine.instance
      .init(automaticCleanup: true)
      .then((_) {
    Debugger.LOG
        .info("SoLoud initialized ; also using automatic cleanup");
    runApp(const HalcyonAppEntry());
  });
}