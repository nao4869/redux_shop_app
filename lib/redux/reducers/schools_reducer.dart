import 'package:redux/redux.dart';
import 'package:redux_shop_app/model/School.dart';
import 'package:redux_shop_app/redux/actions.dart';

final schoolsReducer = combineReducers<List<School>>([
  TypedReducer<List<School>, AddSchoolActio>(_addSchool),
]);

List<School> _addSchool(List<School> schools, AddSchoolActio action) {
  return List.from(schools)..add(action.school);
}
