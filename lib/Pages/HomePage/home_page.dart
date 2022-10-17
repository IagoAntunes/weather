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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //Parte de Cima
                  AppBarOptionsWidget(widget: widget),
                  //Temperature
                  TemperatureWidget(widget: widget),
                  //Details
                  DetailsPrediction(
                    widget: widget,
                  ),
                  //Hour Predictions
                  HoursPredictionsWidget(
                      widget: widget, size: size, listHours: listHours),
                  //Forecast Next Days
                  ForecastNextDays(widget: widget, size: size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarOptionsWidget extends StatelessWidget {
  const AppBarOptionsWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: const Icon(
                  Icons.location_city_outlined,
                  color: Colors.white,
                )),
            const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            )
          ],
        ),
      ],
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: widget.place!.current.tempc.round().toString(),
                style: const TextStyle(color: Colors.white, fontSize: 80),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'º',
                      style: TextStyle(color: Colors.white, fontSize: 70))
                ],
              ),
            ),
            Text(
              widget.place!.current.text,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_upward_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      widget.place!.forecast.forecastday[0].day.maxtempc
                          .round()
                          .toString(),
                      style: const TextStyle(color: Colors.white),
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
                      widget.place!.forecast.forecastday[0].day.mintempc
                          .round()
                          .toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class DetailsPrediction extends StatelessWidget {
  const DetailsPrediction({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.20),
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
                      style: const TextStyle(color: Colors.white),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoursPredictionsWidget extends StatelessWidget {
  const HoursPredictionsWidget({
    Key? key,
    required this.widget,
    required this.size,
    required this.listHours,
  }) : super(key: key);

  final HomePage widget;
  final Size size;
  final List<Hour> listHours;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '${widget.place!.current.lastupdated.substring(8, 10)}/${widget.place!.current.lastupdated.substring(5, 7)}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: listHours[index].tempc.round().toString(),
                              style: const TextStyle(color: Colors.white),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'ºC',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child:
                                Image.network('http:${listHours[index].icon}'),
                          ),
                          Text(
                            listHours[index].time,
                            style: const TextStyle(color: Colors.white),
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
    );
  }
}

class ForecastNextDays extends StatelessWidget {
  const ForecastNextDays({
    Key? key,
    required this.widget,
    required this.size,
  }) : super(key: key);

  final HomePage widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: size.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.20),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Next Forecast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.25,
                child: ListView.builder(
                  itemCount: widget.place!.forecast.forecastday.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.place!.forecast.forecastday[index].date,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Image.network(
                            'http:${widget.place!.forecast.forecastday[index].day.icon}',
                            scale: 2,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: widget.place!.forecast
                                      .forecastday[index].day.maxtempc
                                      .round()
                                      .toString(),
                                  style: const TextStyle(color: Colors.white),
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
                                  text: widget.place!.forecast
                                      .forecastday[index].day.mintempc
                                      .round()
                                      .toString(),
                                  style: const TextStyle(color: Colors.grey),
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
    );
  }
}
