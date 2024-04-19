import 'dart:io';

import 'package:flutter/material.dart';
import 'package:halcyon/debug.dart';
import 'package:halcyon/global.dart';
import 'package:halcyon/ux/config/halcyon_config.dart';
import 'package:halcyon/ux/laf_config/halcyon_laf_config.dart';
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
  Debugger.LOG.info("work_dir=${Directory.current.path}");
  await Future<void>.microtask(HalcyonConfig.loadDebugConfig);
  await Future<void>.microtask(HalcyonLaFConfig.loadDebugLaFConfig);
  Halcyon.instance.audioEngine.init().then((_) {
    Debugger.LOG.info("SoLoud backend initialized!");
    runApp(const HalcyonAppEntry());
  });
}
