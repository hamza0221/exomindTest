import 'package:exomind_test/Repository/WeatherRepository.dart';
import 'package:exomind_test/navigation/navigation_path.dart';
import 'package:exomind_test/view/start_screen.dart';
import 'package:exomind_test/view/weather_screen.dart';
import 'package:exomind_test/view_model/home_viewmodel.dart';
import 'package:exomind_test/view_model/weather_viewmodel.dart';
import 'package:flutter/material.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath>
    implements WeatherRouter, StartRouter {
  bool? _displayWeather;
  @override
  Widget build(BuildContext context) {
    final displayWeather = _displayWeather;
    final List<Page<dynamic>> pagesList = [];

    final startScreen = StartScreen(StartViewModel(this));
    pagesList.add(MaterialPage(child: startScreen));
    if (displayWeather != null && displayWeather == true) {
      final weatherScreen =
          WeatherScreen((WeatherViewModel(WeatherRepository(), this)));
      pagesList.add(MaterialPage(child: weatherScreen));
    }

    return Navigator(
      pages: pagesList,
      onPopPage: (route, result) {
        if (route.didPop(result) == false) {
          return false;
        }
        return onBackButtonTOuched(result);
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  bool onBackButtonTOuched(dynamic result) {
    return true;
  }

  @override
  Future<void> setNewRoutePath(NavigationPath configuration) async {
    final userId = configuration.userId;
    if (userId != null) notifyListeners();
  }

  @override
  void displayWeatherScreen(bool val) {
    _displayWeather = val;
    notifyListeners();
  }

  @override
  void backHome() {
    _displayWeather = false;
    notifyListeners(); // TODO: implement backHome
  }
}

@override
// TODO: implement navigatorKey
GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();

@override
Future<void> setNewRoutePath(NavigationPath configuration) {
  // TODO: implement setNewRoutePath
  throw UnimplementedError();
}
