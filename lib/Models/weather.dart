import 'package:weather/Models/current.dart';
import 'package:weather/Models/forecast.dart';
import 'package:weather/Models/location.dart';

class Weather {
  Location location;
  Current current;
  Forecast forecast;

  Weather(
      {required this.location, required this.current, required this.forecast});

  factory Weather.fromMap(Map<String, dynamic> map) {
    Weather weather;
    Location location = Location.fromMap(map['location']);
    Current current = Current.fromMap(map['current']);
    Forecast forecast = Forecast.fromMap(map['forecast']);
    weather = Weather(
      location: location,
      current: current,
      forecast: forecast,
    );
    return weather;
  }
}
