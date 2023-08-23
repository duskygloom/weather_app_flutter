import 'package:flutter/material.dart';
import 'package:weather/home.dart';
import 'package:weather/styles.dart';


class App extends StatelessWidget 
{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      theme: ThemeData.light(useMaterial3: true).copyWith(appBarTheme: Themes.appbarTheme),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(appBarTheme: Themes.appbarTheme),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
