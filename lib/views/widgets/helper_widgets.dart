import 'package:flutter/material.dart';
import 'package:weather/views/widgets/animated_image.dart';

/* >> THIS WILL SHOW ERROR DETAILS << */
Widget errorWidget(BuildContext context, String error) {
  return Center(
    child: Text(
      error,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge,
    ),
  );
}

/* >>> veritical devider <<< */
Widget vdivider(context) {
  return VerticalDivider(
    indent: 30,
    endIndent: 30,
    width: 5,
    color: Theme.of(context).primaryColor,
  );
}

/* >>> Horizontal devider <<< */
Widget hdivider(context) {
  return Divider(
    indent: 15,
    endIndent: 15,
    height: 5,
    color: Theme.of(context).primaryColor,
  );
}

/* >>> Widget to show climate animation <<< */

Widget showClimate(context, String climate) {
  return switch (climate) {
    "Rain" => animatedWidget(context, "Rain"),
    "Clouds" => animatedWidget(context, "Clouds"),
    "Snow" => animatedWidget(context, "Snow"),
    /* >>> new climate can be added here  */
    (_) => animatedWidget(context, "Sun")
  };
}

/* >>>> section 2 <<<< 

Widget section2(context, data) {
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

 >>>> THIS WILL DISPLAY DATA IN A COLUMN OF ICON TITLE DATA <<<< 
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
*/