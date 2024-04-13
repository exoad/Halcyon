import 'package:flutter/material.dart';
import 'package:halcyon/global.dart';
import 'package:halcyon/snd/audio_engine.dart';
import 'package:halcyon/ui/layout/h_vertical_app.dart';
import 'package:provider/provider.dart';

class HalcyonAppEntry extends StatelessWidget {
  const HalcyonAppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<H_MusicFileProvider>(
            create: (_) => H_MusicFileProvider()),
        ChangeNotifierProvider<HalcyonAudioEngine>.value(
            value: Halcyon.instance.audioEngine)
      ],
      builder: (BuildContext context, Widget? child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              H_VerticalAppLayout() /*Scaffold(
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
                Builder(builder: (BuildContext context) {
                  Queue<HalcyonAudioSource> sources =
                      Halcyon.instance.audioEngine.queue;
                  return Text.rich(TextSpan(children: <InlineSpan>[
                    for (int i = 0; i < sources.length; i++)
                      TextSpan(
                          text: "${sources[i].path}\n",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: i == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal))
                  ]));
                }),
              ],
            ),
          ),
        ),*/
          ),
    );
  }
}
