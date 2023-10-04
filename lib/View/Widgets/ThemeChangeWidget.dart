import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Presentation/Provider/theme_provider.dart';

class ThemeChangeWidget extends StatelessWidget {
  const ThemeChangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          );
        },
      ),
    );
  }
}
