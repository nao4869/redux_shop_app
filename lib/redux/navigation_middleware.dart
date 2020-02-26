import 'package:redux/redux.dart';
import 'package:redux_shop_app/main.dart';
import 'package:redux_shop_app/redux/actions.dart';
import 'package:redux_shop_app/redux/app_state.dart';

List<Middleware<AppState>> createNavigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigate),
  ];
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  next(action); //This need to be after name checks
}

_navigate(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }
  next(action); //This need to be after name checks
}
