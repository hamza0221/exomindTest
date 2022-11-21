import 'package:exomind_test/Repository/WeatherRepository.dart';
import 'package:exomind_test/model/weather.dart';
import 'package:exomind_test/view/weather_screen.dart';
import 'package:flutter/material.dart';

abstract class WeatherRouter {
  void backHome();
}

abstract class IweatherRepository {
  Future<Weather> getWeather(double lat, double long);
}

class WeatherViewModel extends IWeatherViewModel {
  final WeatherRouter _weatherRouter;
  final WeatherRepository _weatherRepo;

  WeatherViewModel(this._weatherRepo, this._weatherRouter);

  @override
  void backHome() {
    _weatherRouter.backHome();
  }

  @override
  Future<Weather> getWeather(double lat, double long) async {
    return await _weatherRepo.getWeather(lat, long);
  }
}
