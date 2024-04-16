import 'package:halcyon/snd/audio_engine.dart';

final class Halcyon {
  late HalcyonAudioEngine audioEngine;

  Halcyon._();

  Future<void> ensureInitialized() async {
    audioEngine = HalcyonAudioEngine();
  }

  static final Halcyon instance = Halcyon._();
}

final class HalcyonManager {
  HalcyonManager._();

  static const double kBorderRadius = 6;
}

// macros and shi i dont wanna type out (they are const so they are inlined)

const String HEX_BLACK = "#000000";
const String HEX_WHITE = "#FFFFFF";
const String HEX_TRANSPARENT = "#00FFFFFF";
