import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop_app/app_routes.dart';

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
        return MainRoute(MyHomePage(), settings: settings);
      case AppRoutes.listSchools:
        return FabRoute(NewGame(), settings: settings);

    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey, // navigator key allows us to navigate without need of context
        navigatorObservers: [routeObserver],
        title: AppLocalizations.appTitle,
        localizationsDelegates: [
          AppLocalizationsDelegate(),
        ],
        theme: theme,
        onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
      ),
    );
  }
}