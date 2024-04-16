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
        $checkedConvert(
            'trackDisplay_ArtworkCornerRadius',
            (v) => val.trackDisplay_ArtworkCornerRadius =
                (v as num?)?.toDouble() ?? 0);
        $checkedConvert(
            'trackDisplay_ArtworkFitStrategy',
            (v) => val.trackDisplay_ArtworkFitStrategy =
                $enumDecodeNullable(_$BoxFitSerializableEnumMap, v) ??
                    BoxFitSerializable.cover);
        $checkedConvert(
            'trackDisplay_TrackNameFontSize',
            (v) => val.trackDisplay_TrackNameFontSize =
                (v as num?)?.toDouble() ?? 20);
        $checkedConvert(
            'trackDisplay_TrackSecondaryInfoFontSize',
            (v) => val.trackDisplay_TrackSecondaryInfoFontSize =
                (v as num?)?.toDouble() ?? 14);
        $checkedConvert('trackDisplay_TrackNameFontWeight',
            (v) => val.trackDisplay_TrackNameFontWeight = v as int? ?? 700);
        $checkedConvert(
            'trackDisplay_TrackSecondaryInfoFontWeight',
            (v) => val.trackDisplay_TrackSecondaryInfoFontWeight =
                v as int? ?? 400);
        $checkedConvert(
            'playbackController_SecondaryButtonSize',
            (v) =>
                val.playbackController_SecondaryButtonSize = v as int? ?? 28);
        $checkedConvert('playbackController_PrimaryButtonSize',
            (v) => val.playbackController_PrimaryButtonSize = v as int? ?? 40);
        $checkedConvert(
            'playbackController_SecondaryButtonBackgroundColor',
            (v) => val.playbackController_SecondaryButtonBackgroundColor =
                v as String? ?? '#000000');
        $checkedConvert(
            'playbackController_SecondaryButtonForegroundColor',
            (v) => val.playbackController_SecondaryButtonForegroundColor =
                v as String? ?? '#FFFFFF');
        $checkedConvert(
            'playbackController_SecondaryButtonBackgroundColorOnActive',
            (v) =>
                val.playbackController_SecondaryButtonBackgroundColorOnActive =
                    v as String? ?? '#FFFFFF');
        $checkedConvert(
            'playbackController_SecondaryButtonForegroundColorOnActive',
            (v) =>
                val.playbackController_SecondaryButtonForegroundColorOnActive =
                    v as String? ?? '#000000');
        $checkedConvert(
            'playbackController_PrimaryButtonBackgroundColor',
            (v) => val.playbackController_PrimaryButtonBackgroundColor =
                v as String? ?? '#000000');
        $checkedConvert(
            'playbackController_PrimaryButtonForegroundColor',
            (v) => val.playbackController_PrimaryButtonForegroundColor =
                v as String? ?? '#FFFFFF');
        $checkedConvert(
            'playbackController_PrimaryButtonBackgroundColorOnActive',
            (v) => val.playbackController_PrimaryButtonBackgroundColorOnActive =
                v as String? ?? '#FFFFFF');
        $checkedConvert(
            'playbackController_PrimaryButtonForegroundColorOnActive',
            (v) => val.playbackController_PrimaryButtonForegroundColorOnActive =
                v as String? ?? '#000000');
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
      'trackDisplay_ArtworkCornerRadius':
          instance.trackDisplay_ArtworkCornerRadius,
      'trackDisplay_ArtworkFitStrategy': _$BoxFitSerializableEnumMap[
          instance.trackDisplay_ArtworkFitStrategy]!,
      'trackDisplay_TrackNameFontSize': instance.trackDisplay_TrackNameFontSize,
      'trackDisplay_TrackSecondaryInfoFontSize':
          instance.trackDisplay_TrackSecondaryInfoFontSize,
      'trackDisplay_TrackNameFontWeight':
          instance.trackDisplay_TrackNameFontWeight,
      'trackDisplay_TrackSecondaryInfoFontWeight':
          instance.trackDisplay_TrackSecondaryInfoFontWeight,
      'playbackController_SecondaryButtonSize':
          instance.playbackController_SecondaryButtonSize,
      'playbackController_PrimaryButtonSize':
          instance.playbackController_PrimaryButtonSize,
      'playbackController_SecondaryButtonBackgroundColor':
          instance.playbackController_SecondaryButtonBackgroundColor,
      'playbackController_SecondaryButtonForegroundColor':
          instance.playbackController_SecondaryButtonForegroundColor,
      'playbackController_SecondaryButtonBackgroundColorOnActive':
          instance.playbackController_SecondaryButtonBackgroundColorOnActive,
      'playbackController_SecondaryButtonForegroundColorOnActive':
          instance.playbackController_SecondaryButtonForegroundColorOnActive,
      'playbackController_PrimaryButtonBackgroundColor':
          instance.playbackController_PrimaryButtonBackgroundColor,
      'playbackController_PrimaryButtonForegroundColor':
          instance.playbackController_PrimaryButtonForegroundColor,
      'playbackController_PrimaryButtonBackgroundColorOnActive':
          instance.playbackController_PrimaryButtonBackgroundColorOnActive,
      'playbackController_PrimaryButtonForegroundColorOnActive':
          instance.playbackController_PrimaryButtonForegroundColorOnActive,
    };

const _$BoxFitSerializableEnumMap = {
  BoxFitSerializable.fill: 'fill',
  BoxFitSerializable.contain: 'contain',
  BoxFitSerializable.cover: 'cover',
  BoxFitSerializable.fitWidth: 'fit-width',
  BoxFitSerializable.none: 'none',
  BoxFitSerializable.fitHeight: 'fit-height',
  BoxFitSerializable.scaleDown: 'scale-down',
};
