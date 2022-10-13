import 'package:flutter/material.dart';
import 'package:place/Models/weather_model.dart';
import 'package:place/Pages/HomePage/home_page.dart';
import 'package:place/Pages/ListWeatherForecasts/add_weather_page.dart';

class ListplacePage extends StatefulWidget {
  ListplacePage({super.key, required this.weathers});
  Weather weathers;
  int id = 0;
  @override
  State<ListplacePage> createState() => _ListplacePageState();
}

class _ListplacePageState extends State<ListplacePage> {
  onGoBack() {
    setState(() {
      widget.id++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black45),
        backgroundColor: Colors.white,
        title: const Text(
          'Select a city',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 1,
        ),
        itemCount: widget.weathers.listPlace!.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        HomePage(place: widget.weathers.listPlace![index]))))),
            child: Container(
              color: widget.weathers.listPlace![index].color!.container,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.weathers.listPlace![index].location.name,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: widget.weathers.listPlace![index].current.tempc
                              .round()
                              .toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'º',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22))
                          ],
                        ),
                      ),
                      Text(
                        widget.weathers.listPlace![index].current.text,
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (() {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) =>
                    AddWeatherPage(weathers: widget.weathers)),
              ),
            ).then((value) => onGoBack());
          });
        }),
      ),
    );
  }
}
