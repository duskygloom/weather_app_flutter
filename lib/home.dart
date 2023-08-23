// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/body.dart';
import 'package:weather/get_weather.dart';
import 'package:weather/styles.dart';
import 'package:weather/weather_classes.dart';


class Home extends StatefulWidget 
{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> 
{
  WeatherCollection? weatherInfo;
  Future<http.Response>? apiResponse;
  http.Response? apiResponseValue;

  void refershWeather() async {
    setState(() => weatherInfo = WeatherCollection.blank());
    try {
      apiResponse = getApiResponse();
      apiResponseValue = await apiResponse;
    } catch (e) {
      debugPrint("No internet connection.");
    }
  }

  @override
  void initState() {
    super.initState();
    refershWeather();
  }

  CurrentWeather getCurrentWeather() {
    CurrentWeather current = weatherInfo?.current ?? CurrentWeather();
    return current;
  }
  
  List<PredictedWeather> getPredictedWeather() {
    List<PredictedWeather> predicted = weatherInfo?.predicted ?? [];
    return predicted;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App", style: TextStyles.title),
        centerTitle: true,
        actions: [IconButton(
          onPressed: () => refershWeather(), 
          icon: const Icon(Icons.refresh),
        ), const SizedBox(width: 6)],
        elevation: 0,
      ),
      body: FutureBuilder(
        future: apiResponse, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator.adaptive(
              strokeCap: StrokeCap.round,
            ));
          weatherInfo = getWeatherInfo(apiResponseValue!);
          return Body(
            getCurrentWeather: getCurrentWeather,
            getPredictedWeather: getPredictedWeather,
          );
        }
      ),
    );
  }
}
