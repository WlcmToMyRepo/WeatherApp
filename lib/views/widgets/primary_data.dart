import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weatherdata.dart';
import 'package:weather/views/widgets/helper_widgets.dart';

Widget mainContent(BuildContext context, Size screen, WeatherData data) {
  log("Screen ${screen.height} * ${screen.width}");
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(color: Colors.amber),
        ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            header(context, data),
            Text(
              // "Sunday 9:44 am",
              DateFormat('EEEE h:mm a').format(DateTime.now()),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* >>>> SWITCH EXPRESSION USED HERE <<<< */

            showAnimation(context, data.climate),
            // animatedWidget(context, "Sun"),
            Column(
              children: [
                Text(
                  data.climate,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text("${data.temp.toStringAsFixed(0)}\u2103",
                    style: Theme.of(context).textTheme.displayMedium!),
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
            rowData(context, Icons.arrow_upward,
                const Color.fromARGB(255, 245, 112, 4), data.maxTemp),
            rowData(context, Icons.arrow_downward,
                const Color.fromARGB(255, 70, 172, 255), data.minTemp)
          ],
        ),
      ],
    ),
  );
}
