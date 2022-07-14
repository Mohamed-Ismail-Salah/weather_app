import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/weather_provider.dart';


class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:    Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/back.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),


          Column(

            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 20,
                  color: Colors.brown.shade100.withOpacity(.5),
                  child: SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Column(
                      children: [
                        Spacer(
                          flex: 3,
                        ),
                        Text(
                          "${Provider.of<WeatherProvider>(context).weatherData.locationName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white
                          ),
                        ),
                        Spacer(
                          flex:1,
                        ),
                        Text(
                          "${Provider.of<WeatherProvider>(context).weatherData.current_last_updated}",
                          style: TextStyle(

                              color: Colors.white
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),

                        Text(
                          "Description of the weather: ${Provider.of<WeatherProvider>(context).weatherData.current_condition_text}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                        Spacer(
                          flex:2,
                        )
                        ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${Provider.of<WeatherProvider>(context).weatherData.current_temp_c}°C",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),

                            SizedBox(width: 50,),
                            Container(

                                child: Image.network(("http:${Provider.of<WeatherProvider>(context).weatherData.current_condition_icon}")
                                  ,fit: BoxFit.cover,
                                  height: 120,width: 120
                                  ,)),

                          ],
                        )
                        ,Spacer(
                          flex:  2,
                        ),

                        Text(
                          "maximum temperature: ${Provider.of<WeatherProvider>(context).weatherData.forecast_forecastday_maxtemp_c} °C",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        Spacer(
                          flex:  1,
                        ),
                        Text(
                          "minimum temperature: ${Provider.of<WeatherProvider>(context).weatherData.forecast_forecastday_mintemp_c} °C",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),

                        Spacer(
                          flex: 5,
                        ),



                      ],
                    ),
                  ),
                ),


              )
              ,
              SizedBox(height: 30,),
              AnimatedButton(
                height: 70,
                width: 200,
                text: 'Back to search',
                isReverse: true,
                selectedTextColor: Colors.black,
                transitionType: TransitionType.LEFT_TO_RIGHT,

                backgroundColor: Colors.brown.shade100.withOpacity(.1),
                borderColor: Colors.brown.shade100.withOpacity(.5),
                borderRadius: 50,
                borderWidth:2,
                onPress: () {

                  Navigator.pop(context);
                },
              ),



            ],
          ),
        ],
      )


    ) ;
  }
}
