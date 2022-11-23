import 'dart:async';

import 'package:exomind_test/model/city.dart';
import 'package:exomind_test/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

abstract class IWeatherViewModel extends ChangeNotifier {
  void backHome();
  Future<City> getWeather(City city);
  double get percent;
}

class WeatherScreen extends StatefulWidget {
  final IWeatherViewModel _viewModel;
  const WeatherScreen(this._viewModel, {Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double percent = 0;
  double time = 0;
  late Timer timer;

  var city;
  @override
  void didChangeDependencies() {
    widget._viewModel.getWeather(paris).then((value) {
      setState(() {
        city = value;
      });
      print(city);
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      time += 5;
      if (time % 10 == 0) {
        int i = 0;
        print("hh");
        widget._viewModel.getWeather(cities![i]).then((val) {
          newCities!.add(val);
        });
        i++;
      }
      setState(() {
        percent += 5;

        if (percent >= 100) {
          timer.cancel();
        }
      });
    });
    print(newCities);
    super.initState();
  }

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
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      alignment: Alignment.center,
      child: LinearPercentIndicator(
        //leaner progress bar
        animation: true,
        animationDuration: 60000,
        lineHeight: 20.0,
        percent: 100 / 100,
        center: Text(
          "$percent %",
          style: const TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: Colors.blue[400],
        backgroundColor: Colors.grey[300],
      ),
    );

    /*Padding(
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
    );*/
  }
}
