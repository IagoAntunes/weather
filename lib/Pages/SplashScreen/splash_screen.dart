import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:place/Models/place.dart';
import 'package:place/Pages/LoginPage/login_page.dart';

import '../../Services/general.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Place? place;
  @override
  void initState() {
    super.initState();
    getApi();
  }

  void getApi() async {
    place ??= await General.getCurrentPlace();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (BuildContext context) => LoginPage(
          place: place!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.cloud,
              color: Colors.blue,
              size: 70,
            ),
            Text(
              'Weather',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 70,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
