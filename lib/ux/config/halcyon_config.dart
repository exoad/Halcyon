import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:halcyon/debug.dart';
import 'package:json_annotation/json_annotation.dart';

part 'halcyon_config.g.dart';

@JsonSerializable(anyMap: true, checked: true)
class HalcyonConfig {
  @JsonKey(defaultValue: true, name: "AudioEngine__use_auto_cleanup")
  bool abe_EngineUseAutoCleanup;

  HalcyonConfig({this.abe_EngineUseAutoCleanup = true});

  factory HalcyonConfig.fromJson(Map<dynamic, dynamic> json) =>
      _$HalcyonConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HalcyonConfigToJson(this);

  static late HalcyonConfig instance;

  static void loadDebugConfig() {
    Debugger.LOG.info("attempt load_debug_config()");
    String locale = "${Directory.current.path}/test/res/config.yml";
    String yml;
    Uri? uri;
    if (FileSystemEntity.isFileSync(locale)) {
      yml = File(locale).readAsStringSync();
      uri = Uri.parse(locale);
    } else {
      instance = HalcyonConfig();
      Debugger.LOG.warn(
          "No config file found at $locale! then using default config constructor");
      return;
    }
    instance = checkedYamlDecode(
        yml, (Map<dynamic, dynamic>? r) => HalcyonConfig.fromJson(r!),
        sourceUrl: uri);
    Debugger.LOG.info("config loaded: ${instance.toJson()}");
  }
}
