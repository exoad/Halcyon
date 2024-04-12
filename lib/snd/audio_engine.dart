import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:halcyon/debug.dart';
import 'package:halcyon/snd/audio_characteristic.dart';
import 'package:halcyon/snd/error_codes.dart';
import 'package:halcyon/ux/h_option.dart';

enum HalcyonEngineState {
  stopped,
  loaded,
  playing,
  paused,
  dispose,
  initialized,
  uninitialized;
}

class ElapsedTimeMutator with ChangeNotifier {
  Duration _elapsed;
  final Duration total;

  ElapsedTimeMutator(this.total, [this._elapsed = Duration.zero]);

  Duration get remaining => total - _elapsed;

  double get progress =>
      _elapsed.inMilliseconds / total.inMilliseconds;

  Duration get elapsed => _elapsed;

  void increment() {
    _elapsed += const Duration(milliseconds: 100);
    notifyListeners();
  }

  set elapsed(Duration elapsed) {
    _elapsed = elapsed;
    notifyListeners();
  }
}

class HalcyonAudioEngine with ChangeNotifier {
  /// u shld not have to use this directly and shld only do so for minute and low-level operations
  final SoLoud instance;
  late HalcyonEngineState _state;
  late StreamController<HalcyonEngineState> _stateStream;
  late StreamController<
      Map<HalcyonAudioCharacteristicType,
          HalcyonAudioCharacteristic>> _characteristicStream;
  late Map<HalcyonAudioCharacteristicType, HalcyonAudioCharacteristic>
      _characteristics;
  final Queue<AudioSource> _queue;
  SoundHandle? _curr;
  bool verboseLogging;

  void _emit(String message) {
    if (verboseLogging) {
      Debugger.LOG.info("HalcyonAudioEngine -> $message");
    }
  }

  void _emitState(HalcyonEngineState state) {
    _state = state;
    _stateStream.add(state);
  }

  void setCharacteristic(HalcyonAudioCharacteristicType type,
      HalcyonAudioCharacteristic characteristics) {
    switch (type) {
      // this is for fool-proofing our code
      case HalcyonAudioCharacteristicType.looping:
        assert(characteristics is LoopingCharacteristic,
            "Invalid type for $type because it is not a LoopingCharacteristic");
        break;
      case HalcyonAudioCharacteristicType.volume:
        assert(characteristics is VolumeCharacteristic,
            "Invalid type for $type because it is not a VolumeCharacteristic");
        break;
      case HalcyonAudioCharacteristicType.pan:
        assert(characteristics is PanCharacteristic,
            "Invalid type for $type because it is not a PanCharacteristic");
        _characteristics[type] = characteristics;
        break;
    }
    _characteristics[type] = characteristics;
    _characteristicStream.add(_characteristics);
  }

  void _emitCharacteristicsMap(
      Map<HalcyonAudioCharacteristicType, HalcyonAudioCharacteristic>
          characteristics) {
    _characteristics = characteristics;
    _characteristicStream.add(_characteristics);
  }

  HalcyonEngineState get state => _state;

  HalcyonAudioEngine(
      {this.verboseLogging = true,
      LoopingCharacteristic? loop,
      VolumeCharacteristic? volume,
      PanCharacteristic? pan})
      : instance = SoLoud.instance,
        _queue = Queue<AudioSource>(),
        _curr = null {
    _stateStream =
        StreamController<HalcyonEngineState>.broadcast(onListen: () {
      if (verboseLogging) {
        _emit("listener subscribed to state stream");
      }
    }, onCancel: () {
      if (verboseLogging) {
        _emit("listener unsubscribed from state stream");
      }
    });
    _characteristicStream = StreamController<
        Map<HalcyonAudioCharacteristicType,
            HalcyonAudioCharacteristic>>.broadcast(onListen: () {
      if (verboseLogging) {
        _emit("listener subscribed to characteristic stream");
      }
    }, onCancel: () {
      if (verboseLogging) {
        _emit("listener unsubscribed from characteristic stream");
      }
    });
    // ===
    _stateStream.stream.listen((_) {
      if (hasListeners) {
        notifyListeners();
      }
      _emit("State stream emitted $_");
    }); // very verbose
    _characteristicStream.stream.listen((_) {
      if (hasListeners) {
        notifyListeners();
      }
      _emit(
          "Characteristic stream emitted [${_.length}] characteristics");
    }); // very verbose
    _emitState(HalcyonEngineState.uninitialized);
    _emitCharacteristicsMap(<HalcyonAudioCharacteristicType,
        HalcyonAudioCharacteristic>{
      HalcyonAudioCharacteristicType.looping:
          loop ?? const LoopingCharacteristic(looping: false),
      HalcyonAudioCharacteristicType.volume:
          volume ?? const VolumeCharacteristic(volume: 0.75),
      HalcyonAudioCharacteristicType.pan:
          pan ?? PanCharacteristic.center
    });
  }

  int get length => _queue.length;

  bool get isEmpty => _queue.isEmpty;

  bool get isNotEmpty => _queue.isNotEmpty;

  void subscribeToStates(
          void Function(HalcyonEngineState state) listener) =>
      _stateStream.stream.listen(listener);

  void subscribeToCharacteristics(
          void Function(
                  Map<HalcyonAudioCharacteristicType,
                          HalcyonAudioCharacteristic>
                      characteristics)
              listener) =>
      _characteristicStream.stream.listen(listener);

  Future<void> init() async {
    _emit("attempt fx_init()");
    if (!instance.isInitialized) {
      await instance.init();
      if (verboseLogging) {
        _emit("Halcyon inits the SOLOUD audio engine");
      }
      _emitState(HalcyonEngineState.initialized);
    }
  }

  Future<OptionReason<dynamic>> loadFromFile(String path) async {
    _emit("attempt fx_load_from_file -> $path");
    AudioSource? src;
    try {
      src = await instance.loadFile(path, mode: LoadMode.disk);
    } catch (e) {
      return OptionReason<dynamic>(
        description:
            "[${HalcyonAudioEngineErrorCodes.FAILED_TO_LOAD_DUE_TO_EXCEPTION}] Failed to load file from $path because of $e.",
        payload: e,
        title: "Failed to load file",
      );
    }
    _queue.add(src);
    _emitState(HalcyonEngineState.loaded);
    return OptionReason.good;
  }

  bool get isInitialized => instance.isInitialized;

  Future<OptionReason<int>> play() async {
    _emit("attempt fx_play()");
    if (isEmpty) {
      return const OptionReason<int>(
        description:
            "[${HalcyonAudioEngineErrorCodes.QUEUE_IS_EMPTY}] No audio sources to play",
        title: "No audio sources",
      );
    }
    AudioSource src = _queue.first;
    _curr = await instance.play(src,
        volume:
            (_characteristics[HalcyonAudioCharacteristicType.volume]
                    as VolumeCharacteristic)
                .volume,
        looping:
            (_characteristics[HalcyonAudioCharacteristicType.looping]
                    as LoopingCharacteristic)
                .looping,
        pan: (_characteristics[HalcyonAudioCharacteristicType.pan]
                as PanCharacteristic)
            .pan);
    src.allInstancesFinished.listen((_) {
      _emit("audio source finished playing");
      _emitState(HalcyonEngineState.stopped);
    });
    _emitState(HalcyonEngineState.playing);
    return OptionReason.good;
  }

  OptionReason<int> pause() {
    _emit("attempt fx_pause()");
    if (_curr == null) {
      return const OptionReason<int>(
        description:
            "[${HalcyonAudioEngineErrorCodes.QUEUE_IS_EMPTY}] No audio sources to pause",
        title: "No audio sources",
      );
    }
    instance.pauseSwitch(
        _curr!); // yo why cant we just remove the "!" here?
    _emitState(HalcyonEngineState.paused);
    return OptionReason.good;
  }

  Future<OptionReason<int>> stop() async {
    _emit("attempt fx_stop()");
    if (_curr == null) {
      return const OptionReason<int>(
        description:
            "[${HalcyonAudioEngineErrorCodes.QUEUE_IS_EMPTY}] No audio sources to stop",
        title: "No audio sources",
      );
    }
    await instance.stop(_curr!);
    _emitState(HalcyonEngineState.stopped);
    return OptionReason.good;
  }

  Future<void> disposeCurrent() async {
    _emit("attempt fx_dispose_current()");
    await instance.disposeSource(_queue.removeFirst());
    _emitState(HalcyonEngineState.dispose);
  }
}
