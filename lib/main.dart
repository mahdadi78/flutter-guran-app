import 'package:flutter/material.dart';
import 'package:ghoran_app/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

const Color color1 = Color(0xff424874);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
