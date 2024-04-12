import 'package:flutter/material.dart';
import 'package:halcyon/global.dart';
import 'package:halcyon/snd/audio_engine.dart';
import 'package:provider/provider.dart';

class H_PlayStreamButton extends StatefulWidget {
  const H_PlayStreamButton({super.key});

  @override
  State<H_PlayStreamButton> createState() =>
      _H_PlayStreamButtonState();
}

class _H_PlayStreamButtonState extends State<H_PlayStreamButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
        onPressed: () {
          if (Halcyon.instance.audioEngine.state !=
              HalcyonAudioEngineState.playing) {
            Halcyon.instance.audioEngine.play();
          } else {
            Halcyon.instance.audioEngine.pause();
          }
          setState(() {});
        },
        style: IconButton.styleFrom(
            splashFactory: NoSplash.splashFactory),
        icon: Provider.of<HalcyonAudioEngine>(context).state ==
                HalcyonAudioEngineState.playing
            ? const Icon(Icons.pause_rounded)
            : const Icon(Icons.play_arrow_rounded));
  }
}
