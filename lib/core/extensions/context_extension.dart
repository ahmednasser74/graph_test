import 'package:flutter/material.dart';

extension NavExtension on BuildContext {
  Future<dynamic> push(Widget page) async {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    return await Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedReplacement(String routeName, {Object? arguments}) async {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void popUntilNamed(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  Future<dynamic> pushRoute(Route route) async {
    Navigator.of(this).push(route);
  }

  Future<dynamic> pushReplacement(Widget page) async {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) async {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments}) async {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false, arguments: arguments);
  }

  void pop([result]) async => Navigator.of(this).pop(result);

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }
}

extension UIContextExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get seconderColor => Theme.of(this).colorScheme.secondary;
  Brightness get brightness => Theme.of(this).brightness;
  bool get isDarkTheme => brightness == Brightness.dark;
}
