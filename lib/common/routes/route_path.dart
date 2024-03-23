part of 'routes.dart';

abstract class RoutePath {
  const RoutePath._();

  static const String initial = "/";
  static const String main = "/main";
  static const String home = "/home";
  static const String createTodo = "/create_todo";

}

extension RouteLocationExts on String {
  String toNamed() {
    return substring(1);
  }
}