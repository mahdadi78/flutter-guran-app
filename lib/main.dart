import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghoran_app/controllers/my_controller.dart';
import 'package:ghoran_app/sureh_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

final controller = Get.put(MyController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurehPage(),
    );
  }
}
