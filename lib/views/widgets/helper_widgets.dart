import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

Widget header(context, data) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(data.cityName.toString(),
            style: Theme.of(context).textTheme.displayLarge!),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.location_on,
              size: 50,
              color: Colors.red,
            ))
      ],
    ),
  );
}

/* >>>>>>>>> DATA DISPLAYED IN ROW <<<<<<<<< */
Widget rowData(
  BuildContext context,
  IconData icon,
  Color color,
  double temp,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: color,
        size: 25,
      ),
      const SizedBox(
        width: 3,
      ),
      Text(
        "${temp.toStringAsFixed(0)} \u2103",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ],
  );
}

/* >>>>> ANIMATION WIDGET <<<<<<< */
Widget animatedWidget(context, String name, {height = 200}) {
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(color: Colors.red),
        ),
    child: Lottie.asset(
      'assets/animations/$name.json',
      height: height + 0.0,
      reverse: true,
      repeat: true,
      fit: BoxFit.cover,
    ),
  );
}

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
Widget hdivider(context, [startIndent = 15, endIndent = 15]) {
  return Divider(
    indent: startIndent + 0.0,
    endIndent: endIndent + 0.0,
    height: 5,
    color: Theme.of(context).primaryColor,
  );
}

/* >>> Widget to show climate animation <<< */

Widget showAnimation(context, String climate, [height = 200.0]) {
  return switch (climate) {
    "Rain" => animatedWidget(context, "Rain", height: height),
    "Clouds" => animatedWidget(context, "Clouds", height: height),
    "Snow" => animatedWidget(context, "Snow", height: height),
    /* >>> new climate can be added here  */
    (_) => animatedWidget(context, "Sun", height: height)
  };
}

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

Widget displayRow(
    BuildContext context, IconData icon, String title, String data) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
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
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              data,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ],
    ),
  );
}
