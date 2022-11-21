import 'dart:ui';
import 'package:exomind_test/model/weather.dart';
import 'package:exomind_test/utils/project_assets.dart';
import 'package:exomind_test/utils/project_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

abstract class IWeatherViewModel extends ChangeNotifier {
  void backHome();
  Future<Weather> getWeather(double lat, double long);
}

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
    return InkWell(
      onTap: () {
        widget._viewModel.backHome();
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Icon(
          Icons.arrow_back,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget pageContent(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: LinearPercentIndicator(
        width: 140.0,
        lineHeight: 14.0,
        percent: 0.5,
        center: Text(
          "50.0%",
          style: const TextStyle(fontSize: 12.0),
        ),
        linearStrokeCap: LinearStrokeCap.roundAll,
        backgroundColor: Colors.grey,
        progressColor: Colors.blue,
      ),
    );
  }
}
