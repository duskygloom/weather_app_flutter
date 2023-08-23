import 'package:flutter/material.dart';
import 'package:weather/styles.dart';
import 'package:weather/weather_classes.dart';


class HourlyWeatherCard extends StatelessWidget 
{
  final String time, temperature;
  final IconData icon;
  const HourlyWeatherCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 90,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time, style: TextStyles.body),
              Icon(icon, size: 28),
              Text(temperature, style: TextStyles.body),
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyWeatherBox extends StatelessWidget 
{
  final Function getWeatherFunction;
  const HourlyWeatherBox({super.key, required this.getWeatherFunction});

  @override
  Widget build(BuildContext context) {
    final List<PredictedWeather> predicted = getWeatherFunction();
    List<HourlyWeatherCard> children = [];
    IconData weatherIcon;
    for (int i = 0; i < predicted.length; ++i) {
      weatherIcon = WeatherCollection.weatherConditions[predicted[i].type] ?? Icons.radar;
      children.add(HourlyWeatherCard(
        time: predicted[i].time, 
        icon: weatherIcon, 
        temperature: predicted[i].temperature
      ));
    }
    return SizedBox(
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Weather forecast", 
            style: TextStyles.heading,
          ),
          const SizedBox(height: 10),
          SizedBox(
            // width: 100,
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: children,
            ),
          ),
      ]),
    );
  }
}
