import 'dart:ui';

import 'package:weather/Colors/colors.dart';
import 'package:weather/Models/color.dart';
import 'package:weather/Models/current.dart';
import 'package:weather/Models/forecast.dart';
import 'package:weather/Models/location.dart';

class Weather {
  Location location;
  Current current;
  Forecast forecast;
  ColorCustom? color;
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

    // if (current.text == 'Sunny') {
    //   weather.color = ColorCustom(
    //     backgroundColor: ColorsMine.listSunny,
    //     container: Color(0xff288fc4),
    //   );
    // } else {
    //   weather.color = ColorCustom(
    //     backgroundColor: ColorsMine.rain,
    //     container: Color(0xff0c3989),
    //   );
    // }

    weather.color = ColorCustom(
      backgroundColor: ColorsMine.listSunny,
      container: Color(0xff288fc4),
    );
    return weather;
  }
}
