import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_data_provider.dart';
import 'package:weather/views/screens/search_city_page.dart';
import 'package:weather/views/theme/themdata.dart';
// import 'package:weather/views/screens/weatherpage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => WeatherDataProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MThemeData.mLightThemeData,
      darkTheme: MThemeData.mDarkThemeData,
      home: const SearchCity(),
    ),
  ));
}
