import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:halcyon/debug.dart';
import 'package:halcyon/global.dart';
import 'package:halcyon/ux/serialize/boxfit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'halcyon_laf_config.g.dart';

@JsonSerializable(checked: true)
class HalcyonLaFConfig {
  @JsonKey(defaultValue: 6)
  double general_BorderRadius = 6;

  @JsonKey(defaultValue: HEX_WHITE)
  String bbloc_MenuActiveColor = HEX_WHITE;

  @JsonKey(defaultValue: HEX_WHITE)
  String bbloc_MenuInactiveColor = HEX_WHITE;

  @JsonKey(defaultValue: HEX_BLACK)
  String bbloc_MenuChildActiveColor = HEX_BLACK;

  @JsonKey(defaultValue: HEX_BLACK)
  String bbloc_MenuChildInactiveColor = HEX_BLACK;

  @JsonKey(defaultValue: HEX_WHITE)
  String bbloc_ItemActiveColor = HEX_WHITE;

  @JsonKey(defaultValue: HEX_BLACK)
  String bbloc_ItemInactiveColor = HEX_BLACK;

  @JsonKey(defaultValue: HEX_BLACK)
  String bbloc_ItemChildActiveColor = HEX_BLACK;

  @JsonKey(defaultValue: HEX_WHITE)
  String bbloc_ItemChildInactiveColor = HEX_WHITE;

  @JsonKey(defaultValue: HEX_BLACK)
  String timeSeek_ThumbColor = HEX_BLACK;

  @JsonKey(defaultValue: HEX_BLACK)
  String timeSeek_ActiveTrackColor = HEX_BLACK;

  @JsonKey(defaultValue: "#b8b8b8")
  String timeSeek_InactiveTrackColor = "#b8b8b8";

  @JsonKey(defaultValue: "#b8b8b8")
  String timeSeek_SecondaryActiveColor = "#b8b8b8";

  @JsonKey(defaultValue: 0)
  double trackDisplay_ArtworkCornerRadius = 0;

  @JsonKey(defaultValue: BoxFitSerializable.cover)
  BoxFitSerializable trackDisplay_ArtworkFitStrategy =
      BoxFitSerializable.cover;

  @JsonKey(defaultValue: 20)
  double trackDisplay_TrackNameFontSize = 20;

  @JsonKey(defaultValue: 14)
  double trackDisplay_TrackSecondaryInfoFontSize = 14;

  @JsonKey(defaultValue: 700)
  int trackDisplay_TrackNameFontWeight = 700;

  @JsonKey(defaultValue: 400)
  int trackDisplay_TrackSecondaryInfoFontWeight = 400;

  @JsonKey(defaultValue: 28)
  int playbackController_SecondaryButtonSize = 28;

  @JsonKey(defaultValue: 40)
  int playbackController_PrimaryButtonSize = 40;

  @JsonKey(defaultValue: HEX_BLACK)
  String playbackController_SecondaryButtonBackgroundColor =
      HEX_BLACK;

  @JsonKey(defaultValue: HEX_WHITE)
  String playbackController_SecondaryButtonForegroundColor =
      HEX_WHITE;

  @JsonKey(defaultValue: HEX_WHITE)
  String playbackController_SecondaryButtonBackgroundColorOnActive =
      HEX_WHITE;

  @JsonKey(defaultValue: HEX_BLACK)
  String playbackController_SecondaryButtonForegroundColorOnActive =
      HEX_BLACK;

  @JsonKey(defaultValue: HEX_BLACK)
  String playbackController_PrimaryButtonBackgroundColor = HEX_BLACK;

  @JsonKey(defaultValue: HEX_WHITE)
  String playbackController_PrimaryButtonForegroundColor = HEX_WHITE;

  @JsonKey(defaultValue: HEX_WHITE)
  String playbackController_PrimaryButtonBackgroundColorOnActive =
      HEX_WHITE;

  @JsonKey(defaultValue: HEX_BLACK)
  String playbackController_PrimaryButtonForegroundColorOnActive =
      HEX_BLACK;

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
    Map<String, dynamic> map = instance.toJson();
    for (String r in map.keys) {
      Debugger.LOG.info(
          "Debug Loads Property \"$r\"=${instance.toJson()[r]}");
    }
    Debugger.LOG.info("Debug Loads LaF Config [${map.length}]");
    Debugger.printDivider("Debug_Laf");
  }
}
