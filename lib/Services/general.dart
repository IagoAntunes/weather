import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:place/Models/place.dart';

class General {
  static getplace(String city) async {
    String url = 'http://api.weatherapi.com/v1';
    String key = '7af1d97bfbd841b5bbc140044221110';
    Place place;
    final response = await http.get(
      Uri.parse('$url/forecast.json?key=$key&q=$city&days=7'),
    );
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        final map = {
          'location': data['location'],
          'current': data['current'],
          'forecast': data['forecast'],
        };
        place = Place.fromMap(map);
        return place;
      }
    } catch (e) {}
  }

  static getCurrentPlace() async {
    Location location = Location();
    LocationData locationData;
    locationData = await location.getLocation();
    String url = 'http://api.weatherapi.com/v1';
    String key = '7af1d97bfbd841b5bbc140044221110';
    Place place;

    final response = await http.get(
      Uri.parse(
          '$url/forecast.json?key=$key&q=${locationData.latitude},${locationData.longitude}&days=7'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      final map = {
        'location': data['location'],
        'current': data['current'],
        'forecast': data['forecast'],
      };
      place = Place.fromMap(map);
      return place;
    }
  }
}
