class Current {
  int lastupdatedepoch;
  String lastupdated;
  double tempc;
  int isday;
  String text;
  String img;
  double windmph;
  double windkph;
  int winddegree;
  String winddir;
  double pressuremb;
  double pressurein;
  double precipmm;
  double precipin;
  int humidity;
  int cloud;
  double feelslikec;
  double feelslikef;
  double viskm;
  double vismiles;
  double uv;
  double gustmph;
  double gustkph;

  Current({
    required this.lastupdatedepoch,
    required this.cloud,
    required this.feelslikec,
    required this.feelslikef,
    required this.gustkph,
    required this.gustmph,
    required this.humidity,
    required this.isday,
    required this.lastupdated,
    required this.precipin,
    required this.precipmm,
    required this.pressurein,
    required this.pressuremb,
    required this.tempc,
    required this.uv,
    required this.viskm,
    required this.vismiles,
    required this.winddegree,
    required this.winddir,
    required this.windkph,
    required this.windmph,
    this.text = '',
    this.img = '',
  });

  factory Current.fromMap(Map<String, dynamic> map) {
    Current current;
    current = Current(
      lastupdatedepoch: map['last_updated_epoch'],
      cloud: map['cloud'],
      feelslikec: map['feelslike_c'],
      feelslikef: map['feelslike_f'],
      gustkph: map['gust_kph'],
      gustmph: map['gust_mph'],
      humidity: map['humidity'],
      isday: map['is_day'],
      lastupdated: map['last_updated'],
      precipin: map['precip_in'],
      precipmm: map['precip_mm'],
      pressurein: map['pressure_in'],
      pressuremb: map['pressure_mb'],
      tempc: map['temp_c'],
      uv: map['uv'],
      viskm: map['vis_km'],
      vismiles: map['vis_miles'],
      winddegree: map['wind_degree'],
      winddir: map['wind_dir'],
      windkph: map['wind_kph'],
      windmph: map['wind_mph'],
      text: map['condition']['text'],
      img: map['condition']['icon'],
    );
    return current;
  }
}
