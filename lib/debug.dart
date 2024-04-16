import 'package:halcyon/extern/string.dart';
import 'package:mason_logger/mason_logger.dart';

final class Debugger {
  Debugger._(); // hehe dont try to use this class and instantiate it!
  static final Logger LOG = Logger(
      level: Level.verbose,
      theme: LogTheme(
          info: (String? r) =>
              "${DateTime.now().toIso8601String()} [INFO]:  $r",
          err: (String? r) =>
              "${DateTime.now().toIso8601String()} [ERROR]:  $r",
          warn: (String? r) =>
              "${DateTime.now().toIso8601String()} [WARN]:  $r"));

  static void printDivider([String? title, int n = 48]) => LOG.info(
      "${"═".repeat(n ~/ 2)}•°••°•°• ⚠${title == null ? "": " $title ⚠"}  •°•°••°•${"═".repeat(n ~/ 2)}");
}
