import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:halcyon/debug.dart';
import 'package:halcyon/global.dart';
import 'package:halcyon/snd/audio_engine.dart';
import 'package:halcyon/snd/extern_audio_engine.dart';
import 'package:halcyon/ui/h_play_parity_gesture.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:halcyon/util/collection.dart';

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

class H_MusicFileProvider extends ChangeNotifier {
  File? _file;

  File? get file => _file;

  set file(File? value) {
    _file = value;
    Debugger.LOG.info("File set to ${_file?.path}");
    notifyListeners();
  }
}
