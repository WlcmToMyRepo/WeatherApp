import 'package:flutter/material.dart';
import 'package:weather/model/weatherdata.dart';
import 'package:weather/service/weather_api_service.dart';

class WeatherDataProvider extends ChangeNotifier {
  String errorMessage = "";
  String city = "udupi";
  WeatherData? weatherData;

  Future<WeatherData> updateWeatherData() async {
    weatherData = await fetchDataFromApi(city);
    return weatherData!;
  }

  void clearWeatherData() {
    weatherData = null;
    notifyListeners();
  }

  void updateCity(String cityName) {
    city = cityName;
    print("current city $city");
    notifyListeners();
  }
}
