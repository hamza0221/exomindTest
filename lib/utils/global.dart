import 'package:exomind_test/model/city.dart';

const address = "https://api.openweathermap.org/data/2.5/weather";
const token = "41ef6cf8e00938d27553f00a0696c0a5";
const exp =
    "https://api.openweathermap.org/data/2.5/weather?lat=48.866667&lon=2.333333&appid=$token";

final paris = City(name: "paris", lat: 48.866667, long: 2.333333);
final rennes = City(name: "rennes", lat: 48.117266, long: -1.6777926);
final nantes = City(name: "nantes", lat: 47.218371, long: -1.553621);
final lyon = City(name: "lyon", lat: 45.764043, long: 4.835659);
final bordeaux = City(name: "bordeaux", lat: 44.837789, long: -0.57918);
const imageAddress = "http://openweathermap.org/img/w/";
const ceclius = "°C";
const lineBreak = "\n";
const kelvin = 273.15;
List<City>? cities = [paris, rennes, nantes, lyon, bordeaux];
List<City>? newCities = [];
