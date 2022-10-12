import 'package:flutter/material.dart';
import 'package:weather/Pages/HomePage/home_page.dart';
import 'package:weather/Pages/LoginScreen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
