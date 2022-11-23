import 'package:exomind_test/Repository/WeatherRepository.dart';
import 'package:exomind_test/model/city.dart';
import 'package:exomind_test/view/weather_screen.dart';

abstract class WeatherRouter {
  void backHome();
}

abstract class IweatherRepository {
  Future<City> getWeather(City city);
}

class WeatherViewModel extends IWeatherViewModel {
  final WeatherRouter _weatherRouter;
  final WeatherRepository _weatherRepo;
  late double _percent;

  WeatherViewModel(this._weatherRepo, this._weatherRouter);

  @override
  void backHome() {
    _weatherRouter.backHome();
  }

  @override
  Future<City> getWeather(City city) async {
    return await _weatherRepo.getWeather(city);
  }

  @override
  double get percent => _percent;
}
