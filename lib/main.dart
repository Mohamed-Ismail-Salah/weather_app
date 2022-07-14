import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/screens/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
      return WeatherProvider();
    },
      child: MaterialApp(
        home: Home() ,
      ),
    );
  }
}

