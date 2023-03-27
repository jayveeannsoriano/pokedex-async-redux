import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

/// A general action to track the progress of an action in app state or Redux store
abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});
  final String actionKey;

  @override
  void before() => dispatchSync(WaitAction.add(actionKey));

  @override
  void after() => dispatchSync(WaitAction.remove(actionKey));
}
