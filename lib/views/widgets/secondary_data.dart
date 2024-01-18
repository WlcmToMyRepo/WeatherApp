import 'package:flutter/material.dart';
import 'package:weather/views/widgets/helper_widgets.dart';

Widget secondaryData(context, width, data) {
  /* >>>>> IF WIDTH < 500 SHOW IT IN ROW <<<<< */

  if (width > 600) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(30),
        width: width * .40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            dataColumn(context, Icons.air_outlined, "Wind",
                "${data.windSpeedKmph()} KMPH"),
            hdivider(context),
            dataColumn(context, Icons.thermostat, "Feels Like",
                "${data.feelsLike.toStringAsFixed(0)}℃"),
            hdivider(context),
            dataColumn(context, Icons.water_drop_outlined, "Humidity",
                "${data.humidity}%")
          ],
        ),
      ),
    );
  }

  return IntrinsicHeight(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        dataColumn(context, Icons.air_outlined, "Wind",
            "${data.windSpeedKmph()} KMPH"),
        vdivider(context),
        dataColumn(context, Icons.thermostat, "Feels Like",
            "${data.feelsLike.toStringAsFixed(0)}℃"),
        vdivider(context),
        dataColumn(
            context, Icons.water_drop_outlined, "Humidity", "${data.humidity}%")
      ],
    ),
  );
}

/* >>>>> IF WIDTH > 500 SHOW IT IN COLUMN <<<<< */

Widget dataColumn(
    BuildContext context, IconData icon, String title, String data) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          data,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    ),
  );
}
