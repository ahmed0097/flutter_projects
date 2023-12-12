import 'package:flutter/material.dart';
import 'package:flutter_stepform/controller/steps_contoller.dart';
import 'package:flutter_stepform/screens/steps.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StepsController controller = StepsController();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<StepsController>(
        init: controller,
        builder: (_) => MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
