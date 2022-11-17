import 'dart:ui';
import 'package:exomind_test/utils/project_assets.dart';
import 'package:exomind_test/utils/project_style.dart';
import 'package:flutter/material.dart';

abstract class IWeatherViewModel extends ChangeNotifier {}

class WeatherScreen extends StatefulWidget {
  final IWeatherViewModel _viewModel;

  const WeatherScreen(this._viewModel, {Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
            animation: widget._viewModel,
            builder: (context, child) {
              return Column(
                children: [myHeader(context), pageContent(context)],
              );
            }),
      ),
    );
  }

  Widget myHeader(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        ProjectAssets.img_home_header,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        fit: BoxFit.cover,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
              child: Text(
            "Book now",
            style: ProjectStyle.headerCategorieTitle,
            textAlign: TextAlign.right,
          )))
    ]);
  }

  Widget pageContent(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(color: Colors.yellow);
  }
}
