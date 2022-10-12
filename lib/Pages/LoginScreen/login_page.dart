import 'package:flutter/material.dart';
import 'package:weather/Pages/HomePage/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff08244F),
            Color(0xff134CB5),
            Color(0xff0B42AB),
          ],
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
                    height: 450,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Image.asset('assets/login/iconSun.png'),
                          ),
                        ),
                        Positioned(
                          child: Image.asset('assets/login/iconSnow.png'),
                        ),
                        Positioned(
                          right: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Image.asset('assets/login/iconMoonY.png'),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          bottom: 3,
                          child: Image.asset('assets/login/iconSunCloud.png'),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My weather app',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Check Live weather updates all over the world with just one tap',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                        child: SizedBox(
                          height: 100,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xff08244F),
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
                                    builder: ((context) => HomePage()),
                                  ),
                                )),
                            child: Text(
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
