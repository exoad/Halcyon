import 'package:halcyon/snd/error_codes.dart';

final class Option<A, B> {
  final A? _value;
  final B? reason;

  const Option.good({required A value})
      : _value = value,
        reason = null;

  /// oops! the data is gone!?!?
  const Option.bad({required this.reason}) : _value = null;

  bool get isBad => _value == null;

  void onBad(void Function(B? reason) fx) {
    if (isBad) {
      fx.call(reason);
    }
  }

  void onGood(void Function(A value) fx) {
    if (_value != null) {
      fx.call(_value);
    }
  }
}

class OptionReason<T> {
  static const OptionReason<int> good = OptionReason<int>(
    description: "N/A",
    title: "N/A",
    payload: HalcyonAudioEngineErrorCodes.OK,
  );

  final String description;
  final String title;
  final T? payload;

  const OptionReason(
      {required this.description, required this.title, this.payload});

  @override
  String toString() {
    return "$title\n$description";
  }
}
