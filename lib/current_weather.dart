// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:weather/styles.dart';
import 'package:weather/weather_classes.dart';


class CurrentWeatherCard extends StatelessWidget 
{
  final Function getWeatherFunction;
  const CurrentWeatherCard({super.key, required this.getWeatherFunction});

  @override
  Widget build(BuildContext context) {
    CurrentWeather currentWeather = getWeatherFunction();
    final IconData weatherIcon = WeatherCollection.weatherConditions[currentWeather.type] ?? Icons.radar;
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(currentWeather.temperature, style: TextStyles.title.copyWith(fontSize: 32)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(weatherIcon, size: 54),
                    Text(currentWeather.type, style: TextStyles.body),
                ]),
              ],
            ),
            Text(currentWeather.city, style: TextStyles.body.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
