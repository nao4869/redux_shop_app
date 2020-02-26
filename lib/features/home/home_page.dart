import 'package:flutter/material.dart';
import 'package:redux_shop_app/features/home/school_list_item.dart';
import 'package:redux_shop_app/testdata/test_data.dart';
import 'package:redux_shop_app/features/menu/main_menu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SchoolListItem> _schools;

  _HomePageState() {
    var schools = TestData.getRandomSchools(20);
    schools.sort((a, b) => a.name.compareTo(b.name));
    _schools = schools.map((sc) => SchoolListItem(sc))
        .toList();
  }

  Widget _getBody() => ListView.builder(
        itemBuilder: (BuildContext context, int index) => _schools[index],
        itemCount: _schools.length,
      );

  @override
  Widget build(BuildContext context) {
    return MainMenu(_getBody());
  }
}
