import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

RxInt fontSize = 15.obs;

const Color color1 = Color(0xffB19470);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

Widget backgroundImage() {
  return const SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Image(
      fit: BoxFit.cover,
      image: AssetImage(
        'images/bg.jpg',
      ),
    ),
  );
}
