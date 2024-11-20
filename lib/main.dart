import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_step_form/view/my_app.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}
