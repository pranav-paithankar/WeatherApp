import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Presentation/Provider/theme_provider.dart';
import 'View/Screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomeScreen(),
    );
  }
}
