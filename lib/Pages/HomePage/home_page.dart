import 'package:flutter/material.dart';
import 'package:weather/Colors/colors.dart';
import 'package:weather/Models/weather.dart';
import 'package:weather/Services/general.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? weather;
  List<Color> listColor = [];
  Future<bool> getApi() async {
    if (weather == null) {
      weather = await General.getWeather();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getApi(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: const Alignment(0.8, 1),
                colors: weather!.color!.backgroundColor!,
                tileMode: TileMode.mirror,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      //Parte de Cima
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${weather!.location.name}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      //Image
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 200,
                                child: Image.network(
                                  'http:${weather!.current.img}',
                                )),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '${weather!.current.tempc.round().toString()}º',
                                    style: const TextStyle(
                                        fontSize: 50,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Precipitations',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Max.: ${weather!.forecast.forecastday[0].day.maxtempc.round().toString()}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Min.: ${weather!.forecast.forecastday[0].day.mintempc.round().toString()}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Tab
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: weather!.color!.container,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/rain.png'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        '${weather!.forecast.forecastday[0].day.dailychanceofrain}%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/humidity.png'),
                                    Text(
                                      '${weather!.forecast.forecastday[0].day.avghumidity.round().toString()}%',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/wind.png'),
                                    Text(
                                      '${weather!.forecast.forecastday[0].day.maxwindkph.round()} km/h',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: weather!.color!.container,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Today',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        'Mar 9',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: weather!
                                        .forecast.forecastday[0].hour.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                '${weather!.forecast.forecastday[0].hour[index].tempc.round()}ºC',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Image.network(
                                                  'http:${weather!.forecast.forecastday[0].hour[index].icon}'),
                                              Text(
                                                '${weather!.forecast.forecastday[0].hour[index].time}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: weather!.color!.container,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Next Forecast',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'RobotoMono'),
                                    ),
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 130,
                                  child: ListView.builder(
                                    itemCount:
                                        weather!.forecast.forecastday.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              weather!.forecast
                                                  .forecastday[index].date,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Image.network(
                                              'http:${weather!.forecast.forecastday[index].day.icon}',
                                              scale: 2,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    weather!
                                                        .forecast
                                                        .forecastday[index]
                                                        .day
                                                        .mintempc
                                                        .round()
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    weather!
                                                        .forecast
                                                        .forecastday[index]
                                                        .day
                                                        .maxtempc
                                                        .round()
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
              child: Column(
            children: [
              Text(
                'Oi',
                style: TextStyle(color: Colors.white),
              ),
              CircularProgressIndicator(),
            ],
          ));
        }
      },
    );
  }
}
