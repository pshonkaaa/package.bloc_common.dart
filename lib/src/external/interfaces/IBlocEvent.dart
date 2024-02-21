import 'package:pshondation/library.dart';

abstract class IBlocEvent implements IPrettyPrint {
  static const IBlocEvent empty = const _EmptyEvent();

  const IBlocEvent();
}

class _EmptyEvent extends IBlocEvent {
  const _EmptyEvent();
  
  @override
  PrettyPrint toPrettyPrint() {
    return PrettyPrint(title: this);
  }
}