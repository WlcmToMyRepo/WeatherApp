import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/weatherdata.dart';
import 'package:weather/providers/weather_data_provider.dart';
import 'package:weather/views/widgets/dashboard.dart';
import 'package:weather/views/widgets/display_erros.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    /* >>>>>>> WEATHER CONSUMER USED HERE <<<<<<<< */
    return Consumer<WeatherDataProvider>(builder:
        (BuildContext context, WeatherDataProvider weatherData, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          scrolledUnderElevation: 0,
          excludeHeaderSemantics: false,
          actions: [
            InkWell(
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
        body: FutureBuilder<WeatherData>(

            /* >>>> FETCHING DATA WITH FUTURE BUILDER <<<<<*/
            future: weatherData.updateWeatherData(),
            builder: (context, snapshot) {
              /* >>>>> ON DATA LOADING SHOW CIRCULAR LOADER <<<<<< */
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              /* >>>>> ON ERROR SHOW THE ERROR WIDGET WITH PROPER MESSAGE <<<<<< */

              else if (snapshot.hasError) {
                var error = snapshot.error.toString();
                log(snapshot.error.toString());
                if (error.contains("ClientException")) {
                  return errorDetails(context, "no_internet");
                } else if (error.contains("NoSuchMethodError")) {
                  return errorDetails(context, "no_data", 200);
                } else {
                  return errorDetails(
                    context,
                    "no_internet",
                  );
                }
              }

              /* >>>>> ONCE DATA RECEIVED DISPLAY THE DATA <<<<<< */

              else if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return errorDetails(context, "no_data1");
                } else {
                  // WeatherData data = snapshot.data!;
                  /* SHOW WEATHER DASHBOARD */
                  return const WeatherDashboard();
                }
              } else {
                return errorDetails(context, "no_internet");
              }
            }),
      );
    });
  }
}
