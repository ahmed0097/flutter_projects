import 'package:flutter/material.dart';
import 'package:flutter_stepform/controller/steps_contoller.dart';
import 'package:get/get.dart';

class StepConfirmation extends StatelessWidget {
  final StepsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // UI for the 'confirmation' step
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Confirmation Page'),
          // Display confirmation information from the controller
          Text('First Name: ${controller.firstNameController.text}'),
          Text('Last Name: ${controller.lastNameController.text}'),
          Text('Address: ${controller.addressController.text}'),
          Text('Birth Date: ${controller.birthDateController.text}'),
           Text('Gender: ${controller.selectedGender.value?.toString().split('.').last}'),
          Text('Email: ${controller.emailController.text}'),
          Text('Phone: ${controller.phoneController.text}'),
          Text(
            'Identification Number: ${controller.identificationNumberController.text}',
          ),
          Text('Card ID: ${controller.cardIdController.text}'),
          Text('University: ${controller.universityController.text}'),
          Text('Class: ${controller.classController.text}'),
          ElevatedButton(
            onPressed: () {
              // Call the method to print user information
              controller.printUserInformation();
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
