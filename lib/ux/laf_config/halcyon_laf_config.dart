import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';

part 'halcyon_laf_config.g.dart';

@JsonSerializable(checked: true)
class HalcyonLaFConfig {
  @JsonKey(defaultValue: 6)
  double general_BorderRadius = 6;

  @JsonKey(defaultValue: "#FFFFFF")
  String bbloc_MenuActiveColor = "#FFFFFF";

  @JsonKey(defaultValue: "#FFFFFF")
  String bbloc_MenuInactiveColor = "#FFFFFF";

  @JsonKey(defaultValue: "#000000")
  String bbloc_MenuChildActiveColor = "#000000";

  @JsonKey(defaultValue: "#000000")
  String bbloc_MenuChildInactiveColor = "#000000";

  @JsonKey(defaultValue: "#FFFFFF")
  String bbloc_ItemActiveColor = "#FFFFFF";

  @JsonKey(defaultValue: "#000000")
  String bbloc_ItemInactiveColor = "#000000";

  @JsonKey(defaultValue: "#000000")
  String bbloc_ItemChildActiveColor = "#000000";

  @JsonKey(defaultValue: "#FFFFFF")
  String bbloc_ItemChildInactiveColor = "#FFFFFF";

  @JsonKey(defaultValue: "#000000")
  String timeSeek_ThumbColor = "#000000";

  @JsonKey(defaultValue: "#000000")
  String timeSeek_ActiveTrackColor = "#000000";

  @JsonKey(defaultValue: "#b8b8b8")
  String timeSeek_InactiveTrackColor = "#b8b8b8";

  @JsonKey(defaultValue: "#b8b8b8")
  String timeSeek_SecondaryActiveColor = "#b8b8b8";

  HalcyonLaFConfig();

  factory HalcyonLaFConfig.fromJson(Map<dynamic, dynamic> json) {
    Map<String, dynamic> map = <String, dynamic>{};
    json.forEach(
        (dynamic key, dynamic value) => map[key.toString()] = value);
    return _$HalcyonLaFConfigFromJson(map);
  }

  Map<String, dynamic> toJson() => _$HalcyonLaFConfigToJson(this);

  static late HalcyonLaFConfig instance;

  static void loadDebugLaFConfig() {
    String locale = "${Directory.current.path}/test/res/laf.yml";
    String yml;
    Uri? uri;
    if (FileSystemEntity.isFileSync(locale)) {
      yml = File(locale).readAsStringSync();
      uri = Uri.parse(locale);
    } else {
      instance = HalcyonLaFConfig();
      return;
    }
    instance = checkedYamlDecode(yml,
        (Map<dynamic, dynamic>? r) => HalcyonLaFConfig.fromJson(r!),
        sourceUrl: uri);
  }
}
