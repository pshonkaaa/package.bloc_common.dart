import 'package:true_core/library.dart';

import 'interfaces/IBlocEvent.dart';

class ValueEvent<T> implements IBlocEvent {
  final T value;
  const ValueEvent(this.value);
  
  @override
  PrettyPrint toPrettyPrint() {
    return PrettyPrint(title: this)
    ..add('value', value);
  }
}

class StringEvent extends ValueEvent<String> {
  const StringEvent(super.value);
}

class IntEvent extends ValueEvent<int> {
  const IntEvent(super.value);
}

class DoubleEvent extends ValueEvent<double> {
  const DoubleEvent(super.value);
}