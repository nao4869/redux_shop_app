import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop_app/app_routes.dart';
import 'package:redux_shop_app/redux/actions.dart';
import 'package:redux_shop_app/redux/app_state.dart';
import 'package:redux_shop_app/redux/selectors.dart';

class BottomNavBar extends StatelessWidget {
  Widget _addPadding(Widget child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: child,
      );

  Widget _getMenuItem(BuildContext context,
      {Icon icon, String routeName, @required _ViewModel vm}) {
    if (!vm.route.contains(routeName))
      return _addPadding(
          IconButton(icon: icon, onPressed: () => vm.navigate(routeName)));
    else
      return _addPadding(IconButton(
          icon: icon,
          onPressed: () => vm.navigate(routeName),
          color: Theme.of(context).accentColor.withOpacity(0.7)));
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8,
      color: Theme.of(context).primaryColor,
      shape: CircularNotchedRectangle(),
      child: StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: (store) => _ViewModel.fromStore(store),
        builder: (context, vm) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _getMenuItem(context,
                icon: Icon(Icons.home), routeName: AppRoutes.home, vm: vm),
            _getMenuItem(context,
                icon: Icon(Icons.school),
                routeName: AppRoutes.addSchool,
                vm: vm),
            SizedBox(width: 16),
            _getMenuItem(context,
                icon: Icon(Icons.school),
                routeName: AppRoutes.addSchool,
                vm: vm),
            SizedBox(width: 16),
            _getMenuItem(context,
                icon: Icon(Icons.school),
                routeName: AppRoutes.addSchool,
                vm: vm),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _ViewModel {
  final List<String> route;
  final Function(String) navigate;

  _ViewModel({@required this.route, @required this.navigate});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        route: currentRoute(store.state),
        navigate: (routeName) =>
            store.dispatch(NavigateReplaceAction(routeName)));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          route == other.route;

  @override
  int get hashCode => route.hashCode;
}
