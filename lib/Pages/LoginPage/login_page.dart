import 'package:flutter/material.dart';
import 'package:place/Models/weather_model.dart';
import '../../Models/place.dart';
import '../ListWeatherForecastsPage/list_weather_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.place});
  Place place;
  @override
  Widget build(BuildContext context) {
    Weather weathers = Weather(listPlace: [place]);

    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(0.8, 1),
          colors: place.color!.backgroundColor!,
          tileMode: TileMode.mirror,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                  child: SizedBox(
                    height: size.height * 0.5,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Image.asset(
                              'assets/login/iconSun.png',
                              scale: 1.2,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            'assets/login/iconSnow.png',
                            scale: 1.2,
                          ),
                        ),
                        Positioned(
                          right: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Image.asset(
                              'assets/login/iconMoonY.png',
                              scale: 1.2,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          bottom: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              'assets/login/iconSunCloud.png',
                              scale: 1.2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My place app',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: size.width * 0.75,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  'Check Live place updates all over the world with just one tap',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                        child: SizedBox(
                          height: size.height * 0.15,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                place.color!.container,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            onPressed: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => ListplacePage(
                                          weathers: weathers,
                                        )),
                                  ),
                                )),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
