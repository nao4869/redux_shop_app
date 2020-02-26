

import 'package:redux_shop_app/redux/app_state.dart';
import 'package:redux_shop_app/redux/reducers/schools_reducer.dart';
import 'package:redux_shop_app/redux/reducers/loading_reducer.dart';
import 'package:redux_shop_app/redux/reducers/navigation_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    schools: schoolsReducer(state.schools, action),
    route: navigationReducer(state.route, action)
  );
}
