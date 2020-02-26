import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redux_shop_app/model/School.dart';

class SchoolListItem extends StatelessWidget {
  final School school;

  const SchoolListItem(this.school, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Card(
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4.0),
                          right: Radius.elliptical(15.0, 25.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          school.name,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '${school.country}',
                        style: TextStyle(fontSize: 20),
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     Text(AppLocalizations.of(context).courtsList(school
                      //         .courts
                      //         .map((court) => '${court.number}')
                      //         .join(", ")))
                      //   ],
                      // ),
                    ],
                  ),
                ),
                // Expanded(
                //     child: AvatarsStack(
                //         school.players.map((player) => player.name).toList())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
