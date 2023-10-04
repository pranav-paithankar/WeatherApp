import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/weather_module.dart';

Future<WeatherData> fetchWeatherData(String cityName) async {
  final apiKey = '2109a912d1599f22d485a5ac7933daad';

  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return WeatherData(
      location: data['name'],
      temperature: data['main']['temp'],
      weatherCondition: data['weather'][0]['description'],
    );
  } else {
    throw Exception('Failed to load weather data');
  }
}
