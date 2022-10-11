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
    return Scaffold(
      body: FutureBuilder(
        future: getApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
