import 'package:exomind_test/model/weather.dart';
import 'package:exomind_test/view_model/weather_viewmodel.dart';

class WeatherRepository extends IweatherRepository {
  @override
  Future<Weather> getWeather(double lat, double long) {
    throw UnimplementedError();
  }
}
