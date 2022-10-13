import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:place/Colors/colors.dart';
import 'package:place/Models/color.dart';
import 'package:place/Models/current.dart';
import 'package:place/Models/forecast.dart';
import 'package:place/Models/location.dart';

class Place {
  Location location;
  Current current;
  Forecast forecast;
  ColorCustom? color;
  Place({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory Place.fromMap(Map<String, dynamic> map) {
    int date = DateTime.now().hour;
    List<String> listTextSun = [
      'sunny',
      'clear',
    ];
    Place place;
    Location location = Location.fromMap(map['location']);
    Current current = Current.fromMap(map['current']);
    Forecast forecast = Forecast.fromMap(map['forecast']);
    place = Place(
      location: location,
      current: current,
      forecast: forecast,
    );
    if (date > 17) {
      place.color = ColorCustom(
        backgroundColor: ColorsMine.night,
        container: ColorsMine.night[0],
      );
    } else {
      if (listTextSun.contains(current.text.toLowerCase())) {
        place.color = ColorCustom(
          backgroundColor: ColorsMine.listSunny,
          container: Color(0xff288fc4),
        );
      } else if (current.text.toLowerCase().contains('rain')) {
        place.color = ColorCustom(
          backgroundColor: ColorsMine.rain,
          container: ColorsMine.rain[0],
        );
      } else if (current.text.toLowerCase().contains('cloudy')) {
        place.color = ColorCustom(
          backgroundColor: ColorsMine.cloudy,
          container: ColorsMine.cloudy[0],
        );
      } else if (current.text.toLowerCase().contains('snow')) {
        place.color = ColorCustom(
          backgroundColor: ColorsMine.snow,
          container: ColorsMine.snow[0],
        );
      }
    }
    return place;
  }
}
