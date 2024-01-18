import 'package:flutter/material.dart';
import 'package:weather/views/widgets/helper_widgets.dart';

Widget secondaryData(context, Size screen, data) {
  /* >>>>> IF WIDTH < 500 SHOW IT IN ROW <<<<< */

  return IntrinsicHeight(
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          dataColumn(context, Icons.air_outlined, "Wind",
              "${data.windSpeedKmph()} KMPH"),
          vdivider(context),
          dataColumn(context, Icons.thermostat, "Feels Like",
              "${data.feelsLike.toStringAsFixed(0)}℃"),
          vdivider(context),
          dataColumn(context, Icons.water_drop_outlined, "Humidity",
              "${data.humidity}%")
        ],
      ),
    ),
  );
}

/* >>>>> IF WIDTH > 500 SHOW IT IN COLUMN <<<<< */

