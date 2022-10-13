import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/Models/weather.dart';
import 'package:weather/Pages/LoginPage/login_page.dart';

import '../../Services/general.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Weather? weather;
  @override
  void initState() {
    super.initState();
    getApi();
  }

  void getApi() async {
    weather ??= await General.getWeather();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (BuildContext context) => LoginPage(
          weather: weather!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.cloud),
          Text('Weather'),
        ],
      ),
    );
  }
}
