// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'halcyon_laf_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HalcyonLaFConfig _$HalcyonLaFConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'HalcyonLaFConfig',
      json,
      ($checkedConvert) {
        final val = HalcyonLaFConfig();
        $checkedConvert('general_BorderRadius',
            (v) => val.general_BorderRadius = (v as num?)?.toDouble() ?? 6);
        $checkedConvert('bbloc_MenuActiveColor',
            (v) => val.bbloc_MenuActiveColor = v as String? ?? '#FFFFFF');
        $checkedConvert('bbloc_MenuInactiveColor',
            (v) => val.bbloc_MenuInactiveColor = v as String? ?? '#FFFFFF');
        $checkedConvert('bbloc_MenuChildActiveColor',
            (v) => val.bbloc_MenuChildActiveColor = v as String? ?? '#000000');
        $checkedConvert(
            'bbloc_MenuChildInactiveColor',
            (v) =>
                val.bbloc_MenuChildInactiveColor = v as String? ?? '#000000');
        $checkedConvert('bbloc_ItemActiveColor',
            (v) => val.bbloc_ItemActiveColor = v as String? ?? '#FFFFFF');
        $checkedConvert('bbloc_ItemInactiveColor',
            (v) => val.bbloc_ItemInactiveColor = v as String? ?? '#000000');
        $checkedConvert('bbloc_ItemChildActiveColor',
            (v) => val.bbloc_ItemChildActiveColor = v as String? ?? '#000000');
        $checkedConvert(
            'bbloc_ItemChildInactiveColor',
            (v) =>
                val.bbloc_ItemChildInactiveColor = v as String? ?? '#FFFFFF');
        $checkedConvert('timeSeek_ThumbColor',
            (v) => val.timeSeek_ThumbColor = v as String? ?? '#000000');
        $checkedConvert('timeSeek_ActiveTrackColor',
            (v) => val.timeSeek_ActiveTrackColor = v as String? ?? '#000000');
        $checkedConvert('timeSeek_InactiveTrackColor',
            (v) => val.timeSeek_InactiveTrackColor = v as String? ?? '#b8b8b8');
        $checkedConvert(
            'timeSeek_SecondaryActiveColor',
            (v) =>
                val.timeSeek_SecondaryActiveColor = v as String? ?? '#b8b8b8');
        return val;
      },
    );

Map<String, dynamic> _$HalcyonLaFConfigToJson(HalcyonLaFConfig instance) =>
    <String, dynamic>{
      'general_BorderRadius': instance.general_BorderRadius,
      'bbloc_MenuActiveColor': instance.bbloc_MenuActiveColor,
      'bbloc_MenuInactiveColor': instance.bbloc_MenuInactiveColor,
      'bbloc_MenuChildActiveColor': instance.bbloc_MenuChildActiveColor,
      'bbloc_MenuChildInactiveColor': instance.bbloc_MenuChildInactiveColor,
      'bbloc_ItemActiveColor': instance.bbloc_ItemActiveColor,
      'bbloc_ItemInactiveColor': instance.bbloc_ItemInactiveColor,
      'bbloc_ItemChildActiveColor': instance.bbloc_ItemChildActiveColor,
      'bbloc_ItemChildInactiveColor': instance.bbloc_ItemChildInactiveColor,
      'timeSeek_ThumbColor': instance.timeSeek_ThumbColor,
      'timeSeek_ActiveTrackColor': instance.timeSeek_ActiveTrackColor,
      'timeSeek_InactiveTrackColor': instance.timeSeek_InactiveTrackColor,
      'timeSeek_SecondaryActiveColor': instance.timeSeek_SecondaryActiveColor,
    };
