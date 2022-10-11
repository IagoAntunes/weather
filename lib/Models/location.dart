class Location {
  String name;
  String region;
  String countr;
  double lat;
  double lon;
  String tzid;
  int localtimeepoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.countr,
    required this.lat,
    required this.lon,
    required this.tzid,
    required this.localtime,
    required this.localtimeepoch,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    Location location;
    location = Location(
      name: map['name'],
      region: map['region'],
      countr: map['country'],
      lat: map['lat'],
      lon: map['lon'],
      tzid: map['tz_id'],
      localtime: map['localtime'],
      localtimeepoch: map['localtime_epoch'],
    );
    return location;
  }
}
