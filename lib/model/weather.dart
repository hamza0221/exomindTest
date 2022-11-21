class Weather {
  String? main;
  String? icon;
  double? temp;

  Weather(this.main, this.icon, this.temp);

  Weather.fromJson(Map<dynamic, dynamic> json) {}

  Map<String, dynamic> toJson() => {"main": main, "icon": icon, "temp": temp};
}
