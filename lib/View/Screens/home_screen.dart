import 'package:flutter/material.dart';
import 'package:weather_app/View/Widgets/ThemeChangeWidget.dart';

import '../../Models/weather_module.dart';
import '../../Presentation/Provider/WeatherProvider.dart';
import '../Widgets/MyDrawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherData> futureWeatherData;

  @override
  void initState() {
    super.initState();
    futureWeatherData = fetchWeatherData('mumbai');
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
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/weather.png'),
            SizedBox(
              width: 50,
            ),
            Center(
              child: FutureBuilder<WeatherData>(
                future: futureWeatherData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Location: ${snapshot.data!.location}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Temperature: ${snapshot.data!.temperature}°C',
                            style: TextStyle(fontSize: 18)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Weather: ${snapshot.data!.weatherCondition}',
                            style: TextStyle(fontSize: 18)),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
