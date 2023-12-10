import 'package:flutter/material.dart';
import 'package:flutter_stepform/screens/step_academic.dart';
import 'package:flutter_stepform/screens/step_confirmation.dart';
import 'package:flutter_stepform/screens/step_info.dart';
import 'package:get/get.dart';

class MyHomePageController extends GetxController {
  var currentStep = 0.obs;

  List<Step> getSteps() => [
        Step(
          title: Text('generale'),
          isActive: currentStep.value == 0,
          content: StepInfo(),
        ),
        Step(
          isActive: currentStep.value == 1,
          title: Text('student'),
          content: StepAcademic(),
        ),
        Step(
          isActive: currentStep.value == 2,
          title: Text('confirmation'),
          content: StepConfirmation(),
        ),
      ];

  void onNextStep() {
    if (currentStep < getSteps().length - 1) {
      currentStep++;
    } else {
      print('All done!');
    }
    update();
  }

  void onPreviousStep() {
    if (currentStep > 0) {
      currentStep--;
    }
    update();
  }

  void goToStep(int step) {
    if (step >= 0 && step < getSteps().length) {
      currentStep.value = step;
      update();
    }
  }
}
