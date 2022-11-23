import 'dart:convert';

import 'package:exomind_test/model/city.dart';
import 'package:exomind_test/model/weather.dart';
import 'package:exomind_test/utils/global.dart';
import 'package:exomind_test/view_model/weather_viewmodel.dart';
import 'package:http/http.dart' as http;

class WeatherRepository extends IweatherRepository {
  @override
  Future<City> getWeather(City city) async {
    var response = await http.get(
      Uri.parse("$address?lat=${city.lat}&lon=${city.long}&appid=$token"),
      headers: {'Content-Type': 'application/json'},
    );
    var jsonresponse = json.decode(response.body);
    //add weather and rely it to City
    Weather weather = Weather();
    weather = Weather.fromJson(jsonresponse);
    city.weather = weather;
    return city;
  }
}
