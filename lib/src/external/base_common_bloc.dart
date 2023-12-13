import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:true_core/library.dart';

import 'base_repository.dart';
import 'interfaces/ICommonBloc.dart';
import 'interfaces/IBlocEvent.dart';
import 'interfaces/IRepository.dart';

abstract class BaseCommonBloc<T extends IRepository, TEnum extends Object, TContext> implements ICommonBloc<TEnum, TContext> {
  BaseCommonBloc({
    required this.repository,
  }) {
    if(repository is! BaseRepository)
      throw ArgumentError('repository is! BaseRepository');
    _repository = repository as BaseRepository;
  }
  
  final T repository;

  final NotifierStorage storage = NotifierStorage();

  late final TContext context;


  @override
  Logger? logger;

  @override
  late String tag = runtimeType.toString();

  @override
  bool get initialized => _initialized;

  @override
  bool get disposed => _disposed;
  
  @override
  @mustCallSuper
  @mustBeOverridden
  void initState(TContext context) {
    if(initialized)
      throw 'Bloc have been already initialized';
    _throwIfDisposed();

    logger?.d('$tag > initState');
      
    this.context = context;
    
    _initialized = true;
  }

  @override
  @mustCallSuper
  @mustBeOverridden
  void onEvent(TEnum type, [IBlocEvent event = IBlocEvent.empty]) {
    _throwIfHaventInitialized();
    _throwIfDisposed();

    logger?.d('$tag > onEvent; type = $type; event = ${event.toPrettyPrint().toString()}');
  }

  @override
  @mustCallSuper
  @mustBeOverridden
  void dispose() {
    _throwIfHaventInitialized();
    _throwIfDisposed();

    logger?.d('$tag > dispose');

    storage.dispose();

    _disposed = true;
  }
  

  late final BaseRepository _repository;
  bool _initialized = false;
  bool _disposed = false;

  void _throwIfHaventInitialized() {
    if(!initialized)
      throw 'Bloc havent been initialized';
  }

  void _throwIfDisposed() {
    if(disposed)
      throw 'Bloc has been disposed';
  }
}



// class BlocRouteResult extends IBlocRouteResult {
//   @override
//   Future<IBlocRouteResult> get future => _completer.future;


//   Completer<IBlocRouteResult> _completer = new Completer();
//   void complete() {
//     _completer.complete(this);
//   }
// }

// abstract class IBlocRouteResult {
//   // Future<IBlocRouteResult> get future;
// }


// abstract class IBlocRouteResult<ENUM extends Object> {
//   void onInitState(BuildContext context) {}
//   void onBuild(BuildContext context) {}
//   void onEvent(ENUM type, IBlocEvent event) {}
//   void onResult(ENUM type, IBlocEvent event) {}
//   void onDispose(BuildContext context) {}
// }