class Day {
  double maxtempc;
  double maxtempf;
  double mintempc;
  double mintempf;
  double avgtempc;
  double avgtempf;
  double maxwindmph;
  double maxwindkph;
  double totalprecipmm;
  double totalprecipin;
  double avgviskm;
  double avgvismiles;
  double avghumidity;
  double uv;
  int dailywillitrain;
  int dailychanceofrain;
  int dailywillitsnow;
  int dailychanceofsnow;
  String text;
  String icon;

  Day(
      {required this.maxtempc,
      required this.avghumidity,
      required this.avgtempc,
      required this.avgtempf,
      required this.avgviskm,
      required this.avgvismiles,
      required this.dailychanceofrain,
      required this.dailychanceofsnow,
      required this.dailywillitrain,
      required this.dailywillitsnow,
      required this.maxtempf,
      required this.maxwindkph,
      required this.maxwindmph,
      required this.mintempc,
      required this.mintempf,
      required this.totalprecipin,
      required this.totalprecipmm,
      required this.uv,
      required this.text,
      required this.icon});

  factory Day.fromMap(Map<String, dynamic> map) {
    Day day;
    day = Day(
      maxtempc: map['maxtemp_c'],
      maxtempf: map['maxtemp_f'],
      mintempc: map['mintemp_c'],
      mintempf: map['mintemp_f'],
      avgtempc: map['avgtemp_c'],
      avgtempf: map['avgtemp_f'],
      maxwindmph: map['maxwind_mph'],
      maxwindkph: map['maxwind_kph'],
      totalprecipmm: map['totalprecip_mm'],
      totalprecipin: map['totalprecip_in'],
      avgviskm: map['avgvis_km'],
      avgvismiles: map['avgvis_miles'],
      avghumidity: map['avghumidity'],
      dailychanceofrain: map['daily_chance_of_rain'],
      dailywillitrain: map['daily_will_it_rain'],
      dailywillitsnow: map['daily_will_it_snow'],
      dailychanceofsnow: map['daily_chance_of_snow'],
      uv: map['uv'],
      text: map['condition']['text'],
      icon: map['condition']['icon'],
    );
    return day;
  }
}
