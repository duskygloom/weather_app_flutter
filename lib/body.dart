import 'package:flutter/material.dart';
import 'package:weather/additional_info.dart';
import 'package:weather/current_weather.dart';
import 'package:weather/hourly_weather.dart';


class Body extends StatelessWidget 
{
  final Function getCurrentWeather, getPredictedWeather;
  const Body({
    super.key, 
    required this.getCurrentWeather, 
    required this.getPredictedWeather
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 160,
            width: double.infinity,
            child: CurrentWeatherCard(getWeatherFunction: getCurrentWeather),
          ),
          const SizedBox(height: 20),
          HourlyWeatherBox(getWeatherFunction: getPredictedWeather),
          const SizedBox(height: 20),
          AdditionalInfoBox(getWeatherFunction: getCurrentWeather),
      ]),
    );
  }
}
