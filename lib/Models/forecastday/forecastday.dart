import 'package:place/Models/forecastday/day.dart';
import 'package:place/Models/forecastday/hour.dart';

class Forecastday {
  String date;
  int dateepoch;
  Day day;
  List<Hour> hour;

  Forecastday({
    required this.date,
    required this.dateepoch,
    required this.day,
    required this.hour,
  });

  factory Forecastday.fromMap(Map<String, dynamic> map) {
    Forecastday forecastday;
    List<Hour> listaHours = [];
    Day day = Day.fromMap(map['day']);
    for (var hour in map['hour']) {
      listaHours.add(Hour.fromMap(hour));
    }
    forecastday = Forecastday(
      date: map['date'],
      dateepoch: map['date_epoch'],
      day: day,
      hour: listaHours,
    );
    return forecastday;
  }
}
