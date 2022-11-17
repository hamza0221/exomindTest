import 'package:exomind_test/navigation/navigation_path.dart';
import 'package:exomind_test/view_model/weather_viewmodel.dart';
import 'package:flutter/material.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath>
    implements WeatherRouter {
  bool? _displayBasket;
  bool? _displayOffer;
  int? _sum;
  List<String>? _isbns;

  @override
  Widget build(BuildContext context) {
    final List<Page<dynamic>> pagesList = [];
    final displayBasket = _displayBasket;
    final displayOffer = _displayOffer;
    final sum = _sum;
    final isbns = _isbns;

    final categoryScreen =
        BooksScreen(CategorieViewModel(BooksRepository(), this));
    pagesList.add(MaterialPage(child: categoryScreen));

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
}

@override
// TODO: implement navigatorKey
GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();

@override
Future<void> setNewRoutePath(NavigationPath configuration) {
  // TODO: implement setNewRoutePath
  throw UnimplementedError();
}
