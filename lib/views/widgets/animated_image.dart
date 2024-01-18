import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget animatedWidget(context, String name) {
  return Lottie.asset(
    'assets/animations/$name.json',
    height: 200,
    reverse: true,
    repeat: true,
    fit: BoxFit.cover,
  );
}
