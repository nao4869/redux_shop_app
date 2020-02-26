import 'dart:math';

import 'package:redux_shop_app/model/School.dart';

class TestData {
  static final _schools = [
    School(
      id: 's1',
      name: 'Oregon State University',
      country: 'USA',
      state: 'OR',
      city: 'Corvallis',
      logo:
          'https://augstudy.com/studytour/wp-content/uploads/2018/03/Oregon-State-University.jpg',
      videoUrl:
          'https://video-nrt1-1.xx.fbcdn.net/v/t39.24130-2/10000000_2568142483461739_1418694443058507705_n.mp4?_nc_cat=109&_nc_sid=985c63&efg=eyJ2ZW5jb2RlX3RhZyI6Im9lcF9oZCJ9&_nc_ohc=ygi-aH-NMz0AX8znClY&_nc_ht=video-nrt1-1.xx&oh=d17fe15021f41290c99dc5f204fe0b09&oe=5F030D51',
    ),
  ];

  static List<School> getRandomSchools(num size) =>
      _getRandomList(size, _schools);

  static List<T> _getRandomList<T>(num size, List<T> list) {
    final random = Random();
    List<T> result = [];
    for (var i = 0; i < size; i++) {
      result.add(list[random.nextInt(list.length)]);
    }
    return result;
  }
}
