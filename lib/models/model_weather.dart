

class WeatherModel{
   String  locationName;
  String  current_last_updated;
 double  current_temp_c;
  String  current_condition_text;
 String current_condition_icon;
   double forecast_forecastday_maxtemp_c;
   double forecast_forecastday_mintemp_c;

 WeatherModel({
     required this.locationName,
   required this.current_last_updated
   , required this.current_temp_c,
  required  this.current_condition_text
   ,
   required this.current_condition_icon,
 required  this.forecast_forecastday_maxtemp_c,
 required  this.forecast_forecastday_mintemp_c,
});

   factory WeatherModel.fromjson(Map<String,dynamic>data){

     return WeatherModel(
         locationName:  data["location"]["name"],
         current_last_updated:data["current"]["last_updated"],
         current_temp_c:data ['current']['temp_c'],
         current_condition_text:data ['current']['condition']['text'],
         current_condition_icon: data['current'] ['condition']['icon'],
         forecast_forecastday_maxtemp_c:data["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
         forecast_forecastday_mintemp_c:data["forecast"]["forecastday"][0]["day"]["mintemp_c"]

     );
   }

}
