import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop_app/app_routes.dart';

import 'package:redux_shop_app/redux/app_state.dart';
import 'package:redux_shop_app/redux/reducers/app_reducer.dart';
import 'package:redux_shop_app/route_aware_widget.dart';
import 'package:redux_shop_app/redux/navigation_middleware.dart';

import 'package:redux_shop_app/features/home/home_page.dart';
import 'package:redux_shop_app/features/newSchool/new_school.dart';
//import 'package:redux_shop_app/features/stub_screen.dart';
//import 'package:redux_shop_app/localization.dart';

void main() => runApp(MyApp());

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final store = Store<AppState>(appReducer,
      initialState: AppState.loading(),
      middleware: createNavigationMiddleware());

  final theme = ThemeData(
    primaryColor: Colors.grey.shade900,
    primaryColorLight: Colors.grey.shade800,
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade800,
    iconTheme: IconThemeData(color: Colors.white),
    accentColor: Colors.yellow[500],
  );

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MainRoute(HomePage(), settings: settings);
      case AppRoutes.addSchool:
        return FabRoute(NewSchool(), settings: settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey:
            navigatorKey, // navigator key allows us to navigate without need of context
        navigatorObservers: [routeObserver],
        title: 'Test',
        theme: theme,
        onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
      ),
    );
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) => RouteAwareWidget(child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}

class FabRoute<T> extends MaterialPageRoute<T> {
  FabRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) => RouteAwareWidget(child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child);
  }
}
