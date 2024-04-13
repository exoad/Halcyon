import 'dart:collection';

extension BetterQueue<T> on Queue<T> {
  T operator [](int index) {
    return elementAt(index);
  }
}
