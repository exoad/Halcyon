// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'halcyon_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HalcyonConfig _$HalcyonConfigFromJson(Map json) => $checkedCreate(
      'HalcyonConfig',
      json,
      ($checkedConvert) {
        final val = HalcyonConfig(
          abe_EngineUseAutoCleanup: $checkedConvert(
              'AudioEngine__use_auto_cleanup', (v) => v as bool? ?? true),
        );
        return val;
      },
      fieldKeyMap: const {
        'abe_EngineUseAutoCleanup': 'AudioEngine__use_auto_cleanup'
      },
    );

Map<String, dynamic> _$HalcyonConfigToJson(HalcyonConfig instance) =>
    <String, dynamic>{
      'AudioEngine__use_auto_cleanup': instance.abe_EngineUseAutoCleanup,
    };
