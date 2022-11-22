import 'package:exomind_test/model/city.dart';

const address = "https://api.openweathermap.org/data/2.5/weather";
const token = "41ef6cf8e00938d27553f00a0696c0a5";
const exp =
    "https://api.openweathermap.org/data/2.5/weather?lat=48.866667&lon=2.333333&appid=$token";
final paris = City("paris", 48.866667, 2.333333);
final rennes = City("rennes", 48.117266, -1.6777926);
final nantes = City("nantes", 47.218371, -1.553621);
final lyon = City("lyon", 45.764043, 4.835659);
final bordeaux = City("bordeaux", 44.837789, -0.57918);
const imageAddress = "http://openweathermap.org/img/w/";
const ceclius = "°C";
const lineBreak = "\n";
const kelvin = 273.15;
