import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/model/weatherdata.dart';
import 'package:weather/service/weather_api_service.dart';

class WeatherDataProvider extends ChangeNotifier {
  String errorMessage = "";
  String? city;
  WeatherData? weatherData;

  Future<WeatherData?> updateWeatherData() async {
    try {
      weatherData = await fetchDataFromApi(city!);
    } on ClientException catch (e) {
      errorMessage = e.message;
      log("ERROR:[[ ${e.message}]]");
    }
    return weatherData;
  }

  void updateCity(String cityName) {
    city = cityName;
    print("current city $city");
    notifyListeners();
  }
}
