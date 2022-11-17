import 'package:exomind_test/Repository/WeatherRepository.dart';
import 'package:exomind_test/view/weather_screen.dart';
import 'package:exomind_test/view_model/weather_viewmodel.dart';

abstract class HomeRouter {}

abstract class IweatherRepository {}

class WeatherViewModel extends IWeatherViewModel {
  final WeatherRouter _weatherRouter;
  final WeatherRepository _weatherRepo;

  WeatherViewModel(this._weatherRepo, this._weatherRouter);
}
