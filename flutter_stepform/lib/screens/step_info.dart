import 'package:flutter/material.dart';
import 'package:flutter_stepform/controller/steps_contoller.dart';
import 'package:get/get.dart';

enum Gender { male, female }
enum IdentificationType { passport, identity }

class StepInfo extends StatelessWidget {
  final Rx<Gender?> selectedGender = Gender.male.obs;
  final Rx<IdentificationType?> selectedIdentificationType = IdentificationType.passport.obs;
   final StepsController genderController = Get.put(StepsController());


  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController addressController;
  final TextEditingController birthDateController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController identificationNumberController;

  StepInfo({
    required this.firstNameController,
    required this.lastNameController,
    required this.addressController,
    required this.birthDateController,
    required this.emailController,
    required this.phoneController,
    required this.identificationNumberController,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: 'First Name',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: 'Last Name',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'Address',
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () async {
              DateTime? selectedDate = await _selectDate(context);
              if (selectedDate != null) {
                birthDateController.text = selectedDate.toString();
                print('birth date: $selectedDate');
              }
            },
            child: IgnorePointer(
              child: TextFormField(
                controller: birthDateController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'Birth Date',
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
         Row(
      children: [
        Text('Gender: '),
        Obx(() => Radio(
              value: Gender.male,
              groupValue: genderController.selectedGender.value,
              onChanged: (Gender? value) {
                genderController.setSelectedGender(value);
                print('Selected gender: $value');
              },
            )),
        Text('Male'),
        Obx(() => Radio(
              value: Gender.female,
              groupValue: genderController.selectedGender.value,
              onChanged: (Gender? value) {
                genderController.setSelectedGender(value);
                print('Selected gender: $value');
              },
            )),
        Text('Female'),
      ],
    ),
          SizedBox(height: 30),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'Phone',
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Identification: '),
              Obx(() => Radio(
                    value: IdentificationType.passport,
                    groupValue: selectedIdentificationType.value,
                    onChanged: (IdentificationType? value) {
                      selectedIdentificationType.value = value;
                    },
                  )),
              Text('Passport'),
              Obx(() => Radio(
                    value: IdentificationType.identity,
                    groupValue: selectedIdentificationType.value,
                    onChanged: (IdentificationType? value) {
                      selectedIdentificationType.value = value;
                    },
                  )),
              Text('Identity'),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: identificationNumberController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: selectedIdentificationType.value == IdentificationType.passport
                  ? 'Passport Number'
                  : 'Identity Number',
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime? selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }

    return selectedDate;
  }
    

}
