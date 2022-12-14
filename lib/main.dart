import 'package:exomind_test/navigation/navigation_delegate.dart';
import 'package:exomind_test/navigation/navigation_route_parser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MTP Books App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: NavigationDelegate(),
      routeInformationParser: NavigationRouteParser(),
    );
  }
}
