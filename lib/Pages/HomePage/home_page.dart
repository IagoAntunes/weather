import 'package:flutter/material.dart';
import 'package:place/Models/forecastday/hour.dart';

import '../../Models/place.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.place});
  Place? place;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int hour = DateTime.now().hour;
    List<Hour> listHours = [];
    for (var element in widget.place!.forecast.forecastday[0].hour) {
      if (int.parse(element.time.substring(0, 2)) >= hour) {
        listHours.add(element);
      }
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(0.8, 1),
          colors: widget.place!.color!.backgroundColor!,
          tileMode: TileMode.mirror,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    //Parte de Cima
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.place!.location.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: (() => Navigator.pop(context)),
                                icon: const Icon(
                                  Icons.home,
                                  color: Colors.white,
                                )),
                            const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                    //Image
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: widget.place!.current.tempc
                                    .round()
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 80),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: 'º',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 70))
                                ],
                              ),
                            ),
                            Text(
                              widget.place!.current.text,
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.arrow_upward_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    Text(
                                      widget.place!.forecast.forecastday[0].day
                                          .maxtempc
                                          .round()
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_downward_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    Text(
                                      widget.place!.forecast.forecastday[0].day
                                          .mintempc
                                          .round()
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    //Tab
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.place!.color!.container,
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
                                      '${widget.place!.forecast.forecastday[0].day.dailychanceofrain}%',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/humidity.png'),
                                  Text(
                                    '${widget.place!.forecast.forecastday[0].day.avghumidity.round().toString()}%',
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/wind.png'),
                                  Text(
                                    '${widget.place!.forecast.forecastday[0].day.maxwindkph.round()} km/h',
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Previsoes horas
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.place!.color!.container,
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
                                height: size.height * 0.16,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listHours.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: listHours[index]
                                                  .tempc
                                                  .round()
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              children: const <TextSpan>[
                                                TextSpan(
                                                    text: 'ºC',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12))
                                              ],
                                            ),
                                          ),
                                          Image.network(
                                              'http:${listHours[index].icon}'),
                                          Text(
                                            listHours[index].time,
                                            style: const TextStyle(
                                                color: Colors.white),
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
                    //Forecast Next Days
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.place!.color!.container,
                          borderRadius: const BorderRadius.all(
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
                                height: size.height * 0.3,
                                child: ListView.builder(
                                  itemCount:
                                      widget.place!.forecast.forecastday.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.place!.forecast
                                                .forecastday[index].date,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Image.network(
                                            'http:${widget.place!.forecast.forecastday[index].day.icon}',
                                            scale: 2,
                                          ),
                                          Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: widget
                                                      .place!
                                                      .forecast
                                                      .forecastday[index]
                                                      .day
                                                      .maxtempc
                                                      .round()
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: 'ºC',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              RichText(
                                                text: TextSpan(
                                                  text: widget
                                                      .place!
                                                      .forecast
                                                      .forecastday[index]
                                                      .day
                                                      .mintempc
                                                      .round()
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                      text: 'ºc',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
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
        ),
      ),
    );
  }
}
