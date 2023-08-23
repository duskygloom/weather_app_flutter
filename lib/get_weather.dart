// ignore_for_file: avoid_print

import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather/get_location.dart';
import 'package:weather/hidden.dart';
import 'package:weather/weather_classes.dart';


Future<http.Response> getApiResponse() async {

  // a default location for reference
  Position position = await getPosition();
  String latitude = position.latitude.toString();
  String longitude = position.longitude.toString();

  const String unitSystem = "metric";

  try {
    print(Uri.https(
      "api.openweathermap.org", 
      "data/2.5/forecast",
      { "lat": latitude, "lon": longitude, "units": unitSystem, "APPID": apikey },
    ));
    final Future<http.Response> response = http.get(Uri.https(
      "api.openweathermap.org", 
      "data/2.5/forecast",
      { "lat": latitude, "lon": longitude, "units": unitSystem, "APPID": apikey },
    ));
    return response;
  } catch (e) {
    print("Could not get any response.");
    rethrow;
  }
}

WeatherCollection getWeatherInfo(http.Response apiResponse) {

  if (apiResponse.statusCode == 200) {
    final jsonResponse = jsonDecode(apiResponse.body);
    if (jsonResponse["cod"] == "200") {
      // current weather details
      dynamic curElement = jsonResponse['list'][1];
      String cityName = jsonResponse['city']['name'];
      cityName = cityName.isEmpty ? "..." : cityName;
      String country = jsonResponse['city']['country'];
      country = country.isEmpty ? "..." : country;
      CurrentWeather current = CurrentWeather(
        temperature: (curElement['main']['temp']).toStringAsFixed(2) + "°C",
        type: curElement['weather'][0]['main'].toString(),
        humidity: curElement['main']['humidity'].toString(),
        windspeed: curElement['wind']['speed'].toString(),
        pressure: curElement['main']['pressure'].toString(),
        city: "$cityName $country",
      );

      // predicted weather details
      PredictedWeather predicted;
      List<PredictedWeather> multiPredicted = [];
      const int offset = 2;
      const int nPredicted = 10;
      DateTime time;
      for (int i = offset; i < nPredicted+offset; ++i) {
        curElement = jsonResponse['list'][i];
        time = DateTime.parse(curElement['dt_txt']);
        predicted = PredictedWeather(
          temperature: (curElement['main']['temp']).toStringAsFixed(1) + "°C",
          type: curElement['weather'][0]['main'].toString(),
          time: "${time.hour.toString().padLeft(2, '0')}:00",
        );
        multiPredicted.add(predicted);
      }

      // returns valid data
      return WeatherCollection(current: current, predicted: multiPredicted);
    }

    // if json status code not 200
    print("Json status code ${jsonResponse['cod']}: ${jsonResponse['message']}");
    return WeatherCollection.blank();
  }

  // if response status code not 200
  print("Response status code ${apiResponse.statusCode}: ${apiResponse.reasonPhrase}");
  return WeatherCollection.blank();
}
