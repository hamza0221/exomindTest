import 'dart:async';

import 'package:exomind_test/data/data.dart';
import 'package:exomind_test/model/city.dart';
import 'package:exomind_test/utils/app_colors.dart';
import 'package:exomind_test/utils/global.dart';
import 'package:exomind_test/utils/infos_messages.dart';
import 'package:exomind_test/utils/project_assets.dart';
import 'package:exomind_test/utils/project_style.dart';
import 'package:exomind_test/utils/size_config.dart';
import 'package:exomind_test/view/widgets/header_item_back.dart';
import 'package:exomind_test/view/widgets/weather_item.dart';
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
  bool loading = false;

  var city;
  @override
  void didChangeDependencies() {
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
        body: SingleChildScrollView(
          child: AnimatedBuilder(
              animation: widget._viewModel,
              builder: (context, child) {
                return Column(
                  children: [
                    HeaderItemBack(
                        backFun: () {
                          widget._viewModel.backHome();
                        },
                        imagePath: ProjectAssets.imgHomeWeather,
                        text: weatherStatText),
                    pageContent(context)
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget listWeathers() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        itemCount: cities?.length,
        itemBuilder: (BuildContext context, int index) {
          return WeatherItem(city: cities?[index]);
        });
  }

  Widget ReInitButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll<Color>(AppColors.greenButton)),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Replay', style: ProjectStyle.bookDescrition), // <-- Text
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Icon(
            Icons.replay,
            size: getProportionateScreenWidth(24),
          ),
        ],
      ),
    );
  }

  Widget pageContent(BuildContext context) {
    return loading
        ? Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30)),
                  alignment: Alignment.center,
                  child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: animDuration,
                    lineHeight: getProportionateScreenHeight(35),
                    percent: 100 / 100,
                    center: Text(
                      "$percent %",
                      style: ProjectStyle.textPercent,
                    ),
                    barRadius: const Radius.circular(16),
                    progressColor: AppColors.blue400,
                    backgroundColor: AppColors.grey300,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text(waitDownload,
                    textAlign: TextAlign.center, style: ProjectStyle.waitText),
              ],
            ))
        : Column(
            children: [
              listWeathers(),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              ReInitButton(),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
            ],
          );
  }
}
