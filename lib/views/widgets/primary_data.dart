import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weatherdata.dart';
import 'package:weather/views/widgets/animated_image.dart';
import 'package:weather/views/widgets/row_data.dart';

Widget mainContent(BuildContext context, double width, WeatherData data) {
  if (width > 600) {
    return Container(
      width: width * .50,
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.red),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(data.cityName.toString(),
                  style: Theme.of(context).textTheme.displayLarge!),
              Text(
                // "Sunday 9:44 am",
                DateFormat('EEEE H:mm a').format(DateTime.now()),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* >>>> SWITCH EXPRESSION USED HERE <<<< */
              switch (data.climate) {
                "Rain" => animatedWidget(context, "Rain"),
                "Clouds" => animatedWidget(context, "Clouds"),
                "Snow" => animatedWidget(context, "snow"),
                (_) => animatedWidget(context, "Sun"),
              },
              // animatedWidget(context, "Sun"),
              Column(
                children: [
                  Text("${data.temp.toStringAsFixed(0)}\u2103",
                      style: Theme.of(context).textTheme.displayMedium!),
                  Text(
                    data.climate,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              rowData(context, 'Max \nTemp', data.maxTemp),
              rowData(context, 'Min \nTemp', data.minTemp)
            ],
          ),
        ],
      ),
    );
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Text(data.cityName.toString(),
              style: Theme.of(context).textTheme.displayLarge!),
          Text(
            // "Sunday 9:44 am",
            DateFormat('EEEE H:mm a').format(DateTime.now()),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /* >>>> SWITCH EXPRESSION USED HERE <<<< */

          switch (data.climate) {
            "Rain" => animatedWidget(context, "Rain"),
            "Clouds" => animatedWidget(context, "Clouds"),
            "Snow" => animatedWidget(context, "snow"),
            /* >>> new climate can be added here  */
            (_) => animatedWidget(context, "Sun")
          },
          // animatedWidget(context, "Sun"),
          Column(
            children: [
              Text("${data.temp.toStringAsFixed(0)}\u2103",
                  style: Theme.of(context).textTheme.displayMedium!),
              Text(
                data.climate,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          rowData(context, 'Max \nTemp', data.maxTemp),
          rowData(context, 'Min \nTemp', data.minTemp)
        ],
      ),
    ],
  );
}
