import 'package:flutter/material.dart';
import 'package:weather/styles.dart';
import 'package:weather/weather_classes.dart';


class AdditionalInfoCard extends StatelessWidget
{
  final IconData iconData;
  final String text, value;
  const AdditionalInfoCard({
    super.key, 
    required this.iconData, 
    required this.text, 
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Icon(iconData, size: 28),
        Text(text, style: TextStyles.body),
        Text(value, style: TextStyles.body),
      ],
    );
  }
}

class AdditionalInfoBox extends StatelessWidget {
  final Function getWeatherFunction;
  const AdditionalInfoBox({
    super.key,
    required this.getWeatherFunction,
  });

  @override
  Widget build(BuildContext context) {
    final CurrentWeather current = getWeatherFunction();
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Column(children: [
          const Text(
            "Additional information", 
            style: TextStyles.heading,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdditionalInfoCard(iconData: Icons.water_drop, text: "Humidity", value: current.humidity),
              AdditionalInfoCard(iconData: Icons.air, text: "Wind speed", value: current.windspeed),
              AdditionalInfoCard(iconData: Icons.beach_access, text: "Pressure", value: current.pressure),
            ],
          ),
      ]),
    );
  }
}

