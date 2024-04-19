import 'package:halcyon/snd/error_codes.dart';
import 'package:halcyon/ux/h_option.dart';
import 'package:mime/mime.dart';

enum AudioSourceSupportedFormats {
  wav(<String>["wav"]),
  ogg(<String>["ogg", "oga"]),
  flag(<String>["flac"]),
  mp3(<String>["mp3"]);

  final List<String> ext;

  const AudioSourceSupportedFormats(this.ext);
}

class HalcyonAudioEngineIOHandler {
  HalcyonAudioEngineIOHandler._();

  static OptionReason validateFile(String path) {
    String? mime = lookupMimeType(path);
    if (mime != null) {
      switch (mime) {
        case "audio/wav":
          return OptionReason.good;
        case "audio/ogg":
          return path.endsWith(".oga") || path.endsWith(".ogg")
              ? OptionReason.good
              : const OptionReason(
                  title: "Unsupported file format",
                  description:
                      "The selected file format for OGG match may be a video based format which is not supported!",
                  payload: HalcyonAudioEngineErrorCodes
                      .UNSUPPORTED_FORMAT); // i feel like this might bite me in the ass later
        case "audio/flac":
          return OptionReason.good;
        case "audio/mp3":
          return OptionReason.good;
      }
    }
    return const OptionReason(
        title: "Couldn't determine file format",
        description:
            "The file format of the file could not be determined and thus cannot be loaded.",
        payload:
            HalcyonAudioEngineErrorCodes.FILE_FORMAT_INDETERMINATE);
  }
}
