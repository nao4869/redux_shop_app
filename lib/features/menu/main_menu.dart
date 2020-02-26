import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_shop_app/app_routes.dart';
import 'package:redux_shop_app/features/menu/bottom_nav_bar.dart';
import 'package:redux_shop_app/redux/actions.dart';
import 'package:redux_shop_app/redux/app_state.dart';

class MainMenu extends StatelessWidget {
  final Widget body;

  MainMenu(this.body);

  Widget _getInfoBarWorkaround() =>
      PreferredSize(child: Container(), preferredSize: Size(0.0, 0.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getInfoBarWorkaround(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => StoreProvider.of<AppState>(context)
            .dispatch(NavigatePushAction(AppRoutes.addSchool)),
        tooltip: 'Add new game',
        child: Icon(Icons.add),
      ),
      body: body,
    );
  }
}
