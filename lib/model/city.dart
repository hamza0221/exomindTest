class City {
  String? name;
  double? lat;
  double? long;

  City(this.name, this.lat, this.long);

  City.fromJson(Map<dynamic, dynamic> json) {}

  Map<String, dynamic> toJson() => {"name": name, "lat": lat, "long": long};
}
