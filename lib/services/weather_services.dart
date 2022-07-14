 import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather/models/model_weather.dart';
class WeatherServices{
  // ignore: non_constant_identifier_names
  String BaseUrl= "http://api.weatherapi.com/v1";
Future<WeatherModel?>getWeather({required String CityName })async

  {
    // ignore: non_constant_identifier_names
    WeatherModel? WeatherData;
    try{
      Uri url =Uri.parse( "$BaseUrl/forecast.json?key=4c2ca41fdcd84343aea160552220507&q=$CityName&days=5");
      http.Response response= await http.get(url );
      Map<String,dynamic> data=jsonDecode(response.body);

       WeatherData= WeatherModel.fromjson(data);

    }catch(e){
print(e);
    }
    return WeatherData;
  }

}

