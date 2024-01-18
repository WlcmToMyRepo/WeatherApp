import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_data_provider.dart';
import 'package:weather/views/screens/weatherpage.dart';
import 'package:weather/views/widgets/helper_widgets.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final TextEditingController cityController = TextEditingController();
  String? error;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  getWeatherDetails(cityName) {
    cityController.text = "";
    Provider.of<WeatherDataProvider>(context, listen: false).clearWeatherData();
    Provider.of<WeatherDataProvider>(context, listen: false)
        .updateCity(cityName);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const WeatherPage()));
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.height < 500) {
      return Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              animatedWidget(context, "title"),
              TextField(
                controller: cityController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: error,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    size: 30,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  hintText: "Enter your city",
                  hintStyle: const TextStyle(
                    fontFamily: "Oswald",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (cityController.text.trim() == "") {
                      setState(() {
                        error = "can't be empty";
                      });
                    } else {
                      setState(() {
                        error = null;
                      });
                      getWeatherDetails(cityController.text.trim());
                    }
                  },
                  child: const Text(
                    "Get Weather",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
            ],
          )),
        ),
      ));
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            animatedWidget(context, "title"),
            TextField(
              controller: cityController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                errorText: error,
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  size: 30,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: "Enter your city",
                hintStyle: const TextStyle(
                  fontFamily: "Oswald",
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (cityController.text.trim() == "") {
                    setState(() {
                      error = "can't be empty";
                    });
                  } else {
                    setState(() {
                      error = null;
                    });
                    getWeatherDetails(cityController.text.trim());
                  }
                },
                child: const Text(
                  "Get Weather",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        )),
      ),
    );
  }
}
