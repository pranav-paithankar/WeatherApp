import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Widgets/MyDrawer.dart';
import '../Widgets/ThemeChangeWidget.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  TextEditingController _cityController = TextEditingController();
  String _weatherInfo = '';

  Future<void> _getWeather(String cityName) async {
    final apiKey =
        '2109a912d1599f22d485a5ac7933daad'; // Replace with your OpenWeatherMap API key
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final weatherData = json.decode(response.body);
      setState(() {
        _weatherInfo = 'Temperature: ${weatherData['main']['temp']}°C\n'
            'Weather: ${weatherData['weather'][0]['description']}';
      });
    } else {
      setState(() {
        _weatherInfo = 'City not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: <Widget>[
          ThemeChangeWidget(), // Add your custom widget here
        ],
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'Enter City'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String cityName = _cityController.text;
                if (cityName.isNotEmpty) {
                  _getWeather(cityName);
                }
              },
              child: Text('Search'),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/weather.png'),
            Text(
              _weatherInfo,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
