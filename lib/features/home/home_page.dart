import 'package:flutter/material.dart';
import 'package:redux_shop_app/features/home/school_list_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SchoolListItem> schools;

  _HomePageState() {
    var schools = TestData.getRandomGames(20);
    schools.sort((a, b) => a.date.compareTo(b.date));
    schools = schools.map((sc) => SchoolListItem(sc))
        .toList();
  }

  Widget _getBody() => ListView.builder(
        itemBuilder: (BuildContext context, int index) => schools[index],
        itemCount: schools.length,
      );

  @override
  Widget build(BuildContext context) {
    return MainMenu(_getBody());
  }
}
