import 'package:flutter/material.dart';

Widget rowData(BuildContext context, String text, double temp) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        "${temp.toStringAsFixed(0)} \u2103",
        style: Theme.of(context).textTheme.displaySmall,
      ),
    ],
  );
}
