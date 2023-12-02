import 'package:flutter/material.dart';
import 'package:weather_app/View/Screens/home_screen.dart';
import 'package:weather_app/View/Screens/setting_screen.dart';

import '../Screens/weather_search_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 55,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to home screen or perform an action
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              // Navigate to settings screen or perform an action
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WeatherSearchPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to settings screen or perform an action
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingScreen()));
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
