enum HalcyonAudioCharacteristicType {
  looping,
  volume,
  pan,
}

sealed class HalcyonAudioCharacteristic {
  const HalcyonAudioCharacteristic();
}

class LoopingCharacteristic extends HalcyonAudioCharacteristic {
  static const LoopingCharacteristic loop =
      LoopingCharacteristic(looping: true);

  final bool looping;

  const LoopingCharacteristic({required this.looping});
}

class VolumeCharacteristic extends HalcyonAudioCharacteristic {
  static const VolumeCharacteristic max =
      VolumeCharacteristic(volume: 1);

  final double volume;

  const VolumeCharacteristic({required this.volume})
      : assert(volume >= 0 && volume <= 1);
}

class PanCharacteristic extends HalcyonAudioCharacteristic {
  static const PanCharacteristic center = PanCharacteristic(pan: 0);

  final double pan;

  const PanCharacteristic({required this.pan})
      : assert(pan >= -1 && pan <= 1);
}
