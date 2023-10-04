import 'IBlocEvent.dart';

abstract class ICommonBloc<TEnum, TContext> {
  
  bool get initialized;

  bool get disposed;

  void initState(TContext context);

  void onEvent(TEnum type, [IBlocEvent event = IBlocEvent.empty]);

  void dispose();
}