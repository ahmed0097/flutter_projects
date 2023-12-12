import 'package:flutter/material.dart';
import 'package:flutter_stepform/screens/step_academic.dart';
import 'package:flutter_stepform/screens/step_confirmation.dart';
import 'package:flutter_stepform/screens/step_info.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StepsController extends GetxController {
  var currentStep = 0.obs;

  // Text controllers steps info
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController identificationNumberController =
      TextEditingController();

// Text controllers steps academic
  final TextEditingController cardIdController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController classController = TextEditingController();

  List<Step> getSteps() => [
        Step(
          title: Text(
            'general',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          isActive: currentStep.value == 0,
          content: StepInfo(
            firstNameController: firstNameController,
            lastNameController: lastNameController,
            addressController: addressController,
            birthDateController: birthDateController,
            emailController: emailController,
            phoneController: phoneController,
            identificationNumberController: identificationNumberController,
            
          ),
        ),
        Step(
          isActive: currentStep.value == 1,
          title: Text(
            'student',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          content: StepAcademic(
            cardIdController: cardIdController,
            universityController: universityController,
            classController: classController,
          ),
        ),
        Step(
          isActive: currentStep.value == 2,
          title: Text(
            'confirmation',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
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

  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> image = Rx<XFile?>(null);

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = Rx<XFile>(pickedFile);
    }
    update();
  }

  void printUserInformation() {
    print('Step 1 Information:');
    print('First Name: ${firstNameController.text}');
    print('Last Name: ${lastNameController.text}');
    print('Address: ${addressController.text}');
    print('Birth Date: ${birthDateController.text}');
    print('Email: ${emailController.text}');
    print('Phone: ${phoneController.text}');
    print('Identification Number: ${identificationNumberController.text}');

    print('\nStep 2 Information:');
    print('Card ID: ${cardIdController.text}');
    print('University: ${universityController.text}');
    print('Class: ${classController.text}');
  }

 
  Rx<Gender?> selectedGender = Gender.male.obs;

  void setSelectedGender(Gender? value) {
    selectedGender.value = value;
  }
}
