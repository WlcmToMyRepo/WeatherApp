import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_data_provider.dart';
import 'package:weather/views/screens/weatherpage.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  getWeatherDetails(cityName) {
    Provider.of<WeatherDataProvider>(context, listen: false)
        .updateCity(cityName);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const WeatherPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: cityController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search_outlined,
                size: 30,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              hintText: "Enter your city",
              hintStyle: TextStyle(
                fontFamily: "Oswald",
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                getWeatherDetails(cityController.text.trim());
              },
              child: const Text(
                "Get Weather",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ],
      )),
    ));
  }
}
