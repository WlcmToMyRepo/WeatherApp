import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/model/weatherdata.dart';

const String apiKey = "dc7bdba93b38aa43e6156e8d17381bbf";

//https://api.openweathermap.org/data/2.5/forecast?q=$mangalore&APPID=dc7bdba93b38aa43e6156e8d17381bbf&units=metric';

// const String url = "api.openweathermap.org";

/*>>>>> FETCHING DATA FROM API <<<<<<<<*/
Future<WeatherData> fetchDataFromApi(String location) async {
  String url =
      'https://api.openweathermap.org/data/2.5/forecast?q=$location&APPID=$apiKey&units=metric';
  http.Response response = await http.get(Uri.parse(url));

  Map<String, dynamic> jsonData = jsonDecode(response.body);

  // print("CLIMATE DETAIL [[ ${jsonData['list'][0]['weather'][0]['main']}]]");
  return WeatherData.fromJson(jsonData);
}
