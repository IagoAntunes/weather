import 'package:place/Models/forecastday/forecastday.dart';

class Forecast {
  List<Forecastday> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromMap(Map<String, dynamic> map) {
    List<Forecastday> forecastday = [];
    Forecast forecast;
    for (var data in map['forecastday']) {
      forecastday.add(Forecastday.fromMap(data));
    }
    forecast = Forecast(
      forecastday: forecastday,
    );
    return forecast;
  }
}
