import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/Models/weather.dart';

//http://api.weatherapi.com/v1/forecast.json?key=7af1d97bfbd841b5bbc140044221110&q=-19.912998,-43.940933
class General {
  static getWeather() async {
    String url = 'http://api.weatherapi.com/v1';
    String key = '7af1d97bfbd841b5bbc140044221110';
    Weather weather;
    final response = await http.get(
      Uri.parse('$url/forecast.json?key=$key&q=-19.912998,-43.940933'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      final map = {
        'location': data['location'],
        'current': data['current'],
        'forecast': data['forecast'],
      };
      weather = Weather.fromMap(map);
      return weather;
    }
  }
}
