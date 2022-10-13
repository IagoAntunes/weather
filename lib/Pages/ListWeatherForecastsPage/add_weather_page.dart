import 'package:flutter/material.dart';
import 'package:place/Models/weather_model.dart';
import 'package:place/Services/general.dart';

import '../../Models/place.dart';

class AddWeatherPage extends StatefulWidget {
  AddWeatherPage({super.key, required this.weathers});
  Weather weathers;

  @override
  State<AddWeatherPage> createState() => _AddWeatherPageState();
}

class _AddWeatherPageState extends State<AddWeatherPage> {
  final TextEditingController controller = TextEditingController();

  bool validate = false;

  void teste(BuildContext context, String text) async {
    Place? place = await General.getplace(text);
    if (place != null) {
      widget.weathers.listPlace!.add(place);
    }

    Navigator.pop(context, widget.weathers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Name City',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'City',
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Insert city name',
                  errorText: validate ? 'Field is Empty' : null,
                  prefixIcon: const Icon(Icons.location_city)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: (() {
                    if (controller.text.isEmpty) {
                      setState(() {
                        validate = true;
                      });
                    } else {
                      setState(() {
                        validate = false;
                      });
                      teste(context, controller.text.toLowerCase().trim());
                    }
                  }),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
