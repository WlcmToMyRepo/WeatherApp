import 'package:flutter/material.dart';
import 'package:weather/views/widgets/helper_widgets.dart';

Widget errorDetails(context, animation, [double height = 200]) {
  return Center(
      child: SizedBox(
    height: height,
    child: animatedWidget(context, animation),
  ));
}
