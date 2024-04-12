import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:halcyon/debug.dart';
import 'package:halcyon/snd/audio_engine.dart';
import 'package:halcyon/ui/h_parity_button.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

final class Halcyon {
  late HalcyonAudioEngine audioEngine;

  Halcyon._();

  Future<void> ensureInitialized() async {
    audioEngine = HalcyonAudioEngine();
  }

  static final Halcyon instance = Halcyon._();
}

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
    runApp(const MainApp());
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<H_MusicFileProvider>(
            create: (_) => H_MusicFileProvider()),
        ChangeNotifierProvider<HalcyonAudioEngine>.value(
            value: Halcyon.instance.audioEngine)
      ],
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blueGrey),
            iconButtonTheme: IconButtonThemeData(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder())))),
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Provider.of<H_MusicFileProvider>(context)
                          .file
                          ?.path ??
                      "No file selected",
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                    "State=${Provider.of<HalcyonAudioEngine>(context).state}"),
                const SizedBox(height: 48),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      H_ToggleIconButton(
                          onPressed: (bool res) {
                            if (res) {
                              Halcyon.instance.audioEngine.play();
                            } else {
                              Halcyon.instance.audioEngine.pause();
                            }
                          },
                          primaryIcon:
                              const Icon(Icons.play_arrow_rounded),
                          secondaryIcon:
                              const Icon(Icons.pause_rounded)),
                      const SizedBox(width: 22),
                      H_ParityIconButton(
                        onHit: () {},
                        parity: (bool _) async {
                          H_MusicFileProvider provider =
                              Provider.of<H_MusicFileProvider>(
                                  context,
                                  listen: false);
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                                  dialogTitle: "Pick an audio file",
                                  type: FileType.custom,
                                  allowedExtensions: <String>[
                                    "mp3",
                                    "wav",
                                    "ogg"
                                  ],
                                  lockParentWindow: true);
                          if (result != null) {
                            File e = result.paths
                                .map((String? path) => File(path!))
                                .first;
                            provider.file = e;
                            Halcyon.instance.audioEngine
                                .loadFromFile(provider.file!.path);
                            return true;
                          } else {
                            return false;
                          }
                        },
                        primaryIcon:
                            const Icon(Icons.file_upload_rounded),
                        secondaryIcon:
                            const Icon(Icons.check_rounded),
                      )
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
