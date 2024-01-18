import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/weatherdata.dart';
import 'package:weather/providers/weather_data_provider.dart';
import 'package:weather/views/widgets/primary_data.dart';
import 'package:weather/views/widgets/secondary_data.dart';

class WeatherDashboard extends StatefulWidget {
  const WeatherDashboard({super.key});

  @override
  State<WeatherDashboard> createState() => _WeatherDashboardState();
}

class _WeatherDashboardState extends State<WeatherDashboard> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    if (screen.width > 600) {
      return Consumer<WeatherDataProvider>(
        builder: (context, data, child) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mainContent(context, screen.width, data.weatherData!),
                const VerticalDivider(),
                secondaryData(context, screen.width, data.weatherData!)
              ],
            ),
          ),
        ),
      );
    }
    return Consumer<WeatherDataProvider>(
      builder: (context, data, child) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mainContent(context, screen.width, data.weatherData!),
              const SizedBox(height: 50),
              secondaryData(context, screen.width, data.weatherData)
            ],
          ),
        ),
      ),
    );
  }
}
