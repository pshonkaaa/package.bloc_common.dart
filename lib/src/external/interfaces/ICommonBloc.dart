import 'package:logger/logger.dart';

import 'IBlocEvent.dart';

abstract class ICommonBloc<TEnum, TContext> {

  Logger? get logger;

  String get tag;
  
  bool get initialized;

  bool get disposed;

  void initState(TContext context);

  void onEvent(TEnum type, [IBlocEvent event = IBlocEvent.empty]);

  void dispose();
}