import 'package:flutter/material.dart';


class CurrentWeather {
  String temperature, type, humidity, windspeed, pressure, city;

  CurrentWeather({
    this.temperature = "...",
    this.type = "...",
    this.humidity = "...",
    this.windspeed = "...",
    this.pressure = "...",
    this.city = "...",
  });
}

class PredictedWeather {
  String temperature, type, time;

  PredictedWeather({
    this.temperature = "...",
    this.type = "...",
    this.time = "...",
  });
}

class WeatherCollection {
  late CurrentWeather current;
  late List<PredictedWeather> predicted;
  bool isBlank = true;

  static const int nPredicted = 20;

  static const Map<String, IconData> weatherConditions = {
    "Thunderstorm" : Icons.thunderstorm,
    "Drizzle" : Icons.water_drop,
    "Rain" : Icons.water,
    "Snow" : Icons.snowing,
    "Mist" : Icons.foggy,
    "Smoke" : Icons.foggy,
    "Haze" : Icons.foggy,
    "Dust" : Icons.foggy,
    "Fog" : Icons.foggy,
    "Sand" : Icons.foggy,
    "Ash" : Icons.foggy,
    "Squall" : Icons.foggy,
    "Tornado" : Icons.foggy,
    "Clear" : Icons.sunny,
    "Clouds" : Icons.cloud,
  };

  WeatherCollection({required this.current, required this.predicted}) {
    isBlank = false;
  }

  WeatherCollection.blank() {
    current = CurrentWeather();
    predicted = [];
  }
}