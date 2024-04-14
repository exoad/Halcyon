import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';

part 'halcyon_laf_config.g.dart';

@JsonSerializable(checked: true)
class HalcyonLaFConfig {
  @JsonKey(defaultValue: 6, name: "laf__borderRadius")
  double kBorderRadius = 6;

  @JsonKey(defaultValue: "#000000", name: "laf__timeSeekThumbColor")
  String timeSeekThumbColor = "#000000";

  HalcyonLaFConfig();

  factory HalcyonLaFConfig.fromJson(Map<String, dynamic> json) =>
      _$HalcyonLaFConfigFromJson(json);

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
    instance = checkedYamlDecode(yml, (Map<dynamic, dynamic>? r) {
      Map<String, dynamic> map = <String, dynamic>{};
      r!.forEach((dynamic key, dynamic value) {
        map[key.toString()] = value;
      });
      return HalcyonLaFConfig.fromJson(map);
    }, sourceUrl: uri);
  }
}
