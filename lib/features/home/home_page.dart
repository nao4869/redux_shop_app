import 'package:flutter/material.dart';
import 'package:redux_shop_app/features/home/school_list_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SchoolListItem> _games;

  _HomePageState() {
    var games = TestData.getRandomGames(20);
    games.sort((a, b) => a.date.compareTo(b.date));
    _games = games.map((game) => GameListItem(game))
        .toList();
  }

  Widget _getBody() => ListView.builder(
        itemBuilder: (BuildContext context, int index) => _games[index],
        itemCount: _games.length,
      );

  @override
  Widget build(BuildContext context) {
    return MainMenu(_getBody());
  }
}
