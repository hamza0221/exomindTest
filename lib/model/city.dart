import 'package:exomind_test/model/weather.dart';

class City {
  String? name;
  double? lat;
  double? long;
  Weather? weather;

  City({this.name, this.lat, this.long, this.weather});

  @override
  String toString() {
    return "($name,$lat,$long,$weather)";
  }
}
