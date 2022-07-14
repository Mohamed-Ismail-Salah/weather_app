import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/model_weather.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/screens/search.dart';
import 'package:weather/services/weather_services.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var photos = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];
  int _pos = 0;
  Color thmcolor = Colors.orange.shade100;
  Color barthmcolor = Colors.orange;

  late Timer _timer;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    _timer = Timer.periodic(new Duration(seconds: 10), (Timer) {
      setState(() {
        _pos = (_pos + 1) % photos.length;
      });
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
    _timer.cancel();
    super.dispose();
    _timer = null!;
  }

  Widget build(BuildContext context) {
    Icon iconse = Icon(Icons.search);
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      DefaultTextStyle(
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (data) async {
                  WeatherServices City_name = WeatherServices();
                  WeatherModel? Weather =
                      await City_name.getWeather(CityName: data);

                  if (data == "" || Weather == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please check the city name or Wi-fi'),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = Weather;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  }
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 32, horizontal: 25),
                  label: Text("search"),
                  hintText: "Enter the city",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIconColor: Colors.white,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  labelStyle: new TextStyle(color: Colors.white),
                  suffixIcon: iconse,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            ScaleTransition(
              scale: _animation,
              child: Container(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage(photos[_pos]))),
            ),
            Spacer(
              flex: 1,
            ),
            Text('Welcome to the weather app '),
            Text(
              '  please search 🔎 for \nthe city 🌎  you want',
            ),
            Spacer(
              flex: 5,
            )
          ],
        ),
      ),
    ]));
  }
}
