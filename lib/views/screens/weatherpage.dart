import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/weatherdata.dart';
import 'package:weather/providers/weather_data_provider.dart';
import 'package:weather/views/widgets/dashboard.dart';
import 'package:weather/views/widgets/helper_widgets.dart';
import 'package:weather/views/widgets/secondary_data.dart';
import 'package:weather/views/widgets/primary_data.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    /* >>>>>>> WEATHER CONSUMER USED HERE <<<<<<<< */
    return Consumer<WeatherDataProvider>(builder:
        (BuildContext context, WeatherDataProvider weatherData, Widget? child) {
      return Scaffold(
        body: FutureBuilder<WeatherData?>(

            /* >>>> FETCHING DATA WITH FUTURE BUILDER <<<<<*/
            future: weatherData.updateWeatherData(),
            builder: (context, snapshot) {
              /* >>>>> ON DATA LOADIN SHOW CIRCULAR LOADER <<<<<< */
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              /* >>>>> ON ERROR SHOW THE ERROR WIDGET WITH PROPER MESSAGE <<<<<< */

              else if (snapshot.hasError) {
                String error = snapshot.error.toString();
                if (error.contains("ClientException")) {
                  error = "Please check your connectivity";
                } else if (error.contains("NoSuchMethodError")) {
                  return errorWidget(context,
                      "Sorry! no city ${weatherData.city} in our database");
                }
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text(snapshot.error.toString())));
                return errorWidget(context, error);
              }
              /* >>>>> ONCE DATA RECEIVED DISPLAY THE DATA <<<<<< */

              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return errorWidget(context,
                      "Sorry! no city ${weatherData.city} in our database");
                } else {
                  // WeatherData data = snapshot.data!;

                  /* SHOW WEATHER DASHBOARD */
                  return const WeatherDashboard();
                  /*return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          mainContent(context, data),
                          const SizedBox(
                            height: 50,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                dataColumn(context, Icons.air_outlined, "Wind",
                                    "${data.windSpeedKmph()} KMPH"),
                                vdivider(context),
                                dataColumn(
                                    context,
                                    Icons.thermostat,
                                    "Feels Like",
                                    "${data.feelsLike.toStringAsFixed(0)}℃"),
                                vdivider(context),
                                dataColumn(context, Icons.water_drop_outlined,
                                    "Humidity", "${data.humidity}%")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );*/
                }
              } else {
                return Center(
                  child: Text(
                    "Something Went wrong",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                );
              }
            }),
      );
    });
  }
}
