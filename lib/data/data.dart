import 'package:exomind_test/model/city.dart';
import 'package:exomind_test/model/weather.dart';

Weather weath = Weather(temp: "14 ", icon: "50d", description: "broken clouds");

final paris =
    City(name: "paris", lat: 48.866667, long: 2.333333, weather: weath);
final rennes =
    City(name: "rennes", lat: 48.117266, long: -1.6777926, weather: weath);
final nantes =
    City(name: "nantes", lat: 47.218371, long: -1.553621, weather: weath);
final lyon = City(name: "lyon", lat: 45.764043, long: 4.835659, weather: weath);
final bordeaux =
    City(name: "bordeaux", lat: 44.837789, long: -0.57918, weather: weath);
List<City>? cities = [paris, rennes, nantes, lyon, bordeaux];
List<City>? newCities = [];
