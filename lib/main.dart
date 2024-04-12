import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:halcyon/debug.dart';
import 'package:halcyon/global.dart';
import 'package:halcyon/snd/audio_engine.dart';
import 'package:halcyon/ui/h_play_parity_gesture.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

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
                      const H_PlayStreamButton(),
                      const SizedBox(width: 22),
                      IconButton(
                        onPressed: () async {
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
                          }
                        },
                        icon: const Icon(Icons.file_upload_rounded),
                      )
                    ]),
                const SizedBox(height: 32),
                Text.rich(TextSpan(children: <InlineSpan>[
                  for (AudioSource src
                      in Halcyon.instance.audioEngine.queue)
                    TextSpan(
                        text: "${src.soundHash.hash}\n",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold))
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
