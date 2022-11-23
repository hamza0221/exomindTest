import 'package:exomind_test/utils/maths.dart';

class Weather {
  String? temp;
  String? icon;
  String? description;

  Weather({
    this.temp,
    this.icon,
    this.description,
  });

  Weather.fromJson(Map<dynamic, dynamic> json) {
    //converting from Kelvin to Celsius ( -273.15)
    //round the double (two after DECIMAL)
    temp = convertTemperature(json['main']['temp']).toStringAsFixed(2);
    icon = (json['weather'][0])['icon'];
    description = (json['weather'][0])['description'];
  }

  @override
  String toString() {
    return "($temp,$icon,$description)";
  }
}
