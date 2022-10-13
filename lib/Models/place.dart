import 'dart:ui';

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
    Place place;
    Location location = Location.fromMap(map['location']);
    Current current = Current.fromMap(map['current']);
    Forecast forecast = Forecast.fromMap(map['forecast']);
    place = Place(
      location: location,
      current: current,
      forecast: forecast,
    );

    // if (current.text == 'Sunny') {
    //   place.color = ColorCustom(
    //     backgroundColor: ColorsMine.listSunny,
    //     container: Color(0xff288fc4),
    //   );
    // } else {
    //   place.color = ColorCustom(
    //     backgroundColor: ColorsMine.rain,
    //     container: Color(0xff0c3989),
    //   );
    // }

    place.color = ColorCustom(
      backgroundColor: ColorsMine.listSunny,
      container: const Color(0xff288fc4),
    );
    return place;
  }
}
