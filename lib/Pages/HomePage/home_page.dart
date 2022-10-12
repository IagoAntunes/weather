import 'package:flutter/material.dart';
import 'package:weather/Models/weather.dart';
import 'package:weather/Services/general.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  Weather? previsao;

  Future<bool> getApi() async {
    if (previsao == null) {
      previsao = await General.getWeather();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.8, 1),
        colors: <Color>[
          Color(0xff08244F),
          Color(0xff134CB5),
          Color(0xff0B42AB),
        ], // Gradient from https://learnui.design/tools/gradient-generator.html
        tileMode: TileMode.mirror,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: FutureBuilder(
            future: getApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
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
                                  'Fortaleza',
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
                                child: Image.asset('assets/suncloud.png')),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '28º',
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white),
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
                                        'Max.: 30º',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Min.: 25',
                                        style: TextStyle(color: Colors.white),
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
                          decoration: const BoxDecoration(
                            color: Color(0xff0d3989),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/rain.png'),
                                    Text(
                                      '6%',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/humidity.png'),
                                    Text(
                                      '90%',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/wind.png'),
                                    Text(
                                      '19 Km/h',
                                      style: TextStyle(color: Colors.white),
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
                          decoration: const BoxDecoration(
                            color: Color(0xff0d3989),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                    itemCount: 4,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                '29º C',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Icon(
                                                  Icons.sunny,
                                                  color: Colors.orange,
                                                ),
                                              ),
                                              Text(
                                                '15:00',
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
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
