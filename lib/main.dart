
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:weather/Ui.dart';
import 'api.dart' as api;

import 'api.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'weather',
      home: Weather(),
    ),
  );
}

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        
        title: Text('weather'),
        centerTitle: true,
        backgroundColorStart: Colors.blueGrey,
        backgroundColorEnd: Colors.indigo,
       
      ),
      body: Ui(),
    );
  }

  
}
