import 'package:exomind_test/Repository/WeatherRepository.dart';
import 'package:exomind_test/view/weather_screen.dart';

abstract class WeatherRouter {}

abstract class IweatherRepository {}

class WeatherViewModel extends IWeatherViewModel {
  final WeatherRouter _weatherRouter;
  final WeatherRepository _weatherRepo;

  WeatherViewModel(this._weatherRepo, this._weatherRouter);
}
