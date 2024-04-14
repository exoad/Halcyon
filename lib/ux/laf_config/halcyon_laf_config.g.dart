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
        $checkedConvert('laf__borderRadius',
            (v) => val.kBorderRadius = (v as num?)?.toDouble() ?? 6);
        $checkedConvert('laf__timeSeekThumbColor',
            (v) => val.timeSeekThumbColor = v as String? ?? '#000000');
        return val;
      },
      fieldKeyMap: const {
        'kBorderRadius': 'laf__borderRadius',
        'timeSeekThumbColor': 'laf__timeSeekThumbColor'
      },
    );

Map<String, dynamic> _$HalcyonLaFConfigToJson(HalcyonLaFConfig instance) =>
    <String, dynamic>{
      'laf__borderRadius': instance.kBorderRadius,
      'laf__timeSeekThumbColor': instance.timeSeekThumbColor,
    };
