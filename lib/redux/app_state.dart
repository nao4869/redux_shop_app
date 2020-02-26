import 'package:meta/meta.dart';
import 'package:redux_shop_app/app_routes.dart';
import 'package:redux_shop_app/model/School.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<School> schools;
  final List<String> route;

  AppState({
    this.isLoading = false,
    this.schools = const [],
    this.route = const [AppRoutes.home],
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<School> schools,
  }) =>
      AppState(
          isLoading: isLoading ?? this.isLoading,
          schools: schools ?? this.schools,
          route: route ?? this.route
      );

  @override
  int get hashCode =>
      isLoading.hashCode ^ schools.hashCode ^ route.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          schools == other.schools &&
          route == other.route;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, schools: $schools, route: $route}';
  }
}
