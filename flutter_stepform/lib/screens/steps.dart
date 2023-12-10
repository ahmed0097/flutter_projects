import 'package:flutter/material.dart';
import 'package:flutter_stepform/controller/steps_contoller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyHomePageController>(
        init: MyHomePageController(),
        builder: (controller) {
          return Stepper(
            type: StepperType.horizontal,
            steps: controller.getSteps(),
            currentStep: controller.currentStep.value,
            onStepContinue: () {
              controller.onNextStep();
            },
            onStepCancel: () {
              controller.onPreviousStep();
            },
            onStepTapped: (step) {
              controller.goToStep(step);
            },
          );
        },
      ),
    );
  }
}
