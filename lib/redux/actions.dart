import 'package:redux_shop_app/model/School.dart';

class AddSchoolActio  {
  final School school;

  AddSchoolActio (this.school);

  @override
  String toString() {
    return 'AddSchoolAction{school: $school}';
  }
}

class NavigateReplaceAction {
  final String routeName;
  
  NavigateReplaceAction(this.routeName);

  @override
  String toString() {
    return 'MainMenuNavigateAction{routeName: $routeName}';
  }
}

class NavigatePushAction {
  final String routeName;

  NavigatePushAction(this.routeName);

  @override
  String toString() {
    return 'NavigatePushAction{routeName: $routeName}';
  }
}

class NavigatePopAction {

  @override
  String toString() {
    return 'NavigatePopAction';
  }
}
