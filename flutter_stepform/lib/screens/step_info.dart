import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Gender { male, female }
enum IdentificationType { passport, identity }

class StepInfo extends StatelessWidget {
  final Rx<Gender?> selectedGender = Gender.male.obs;
  final Rx<IdentificationType?> selectedIdentificationType = IdentificationType.passport.obs;
  final TextEditingController identificationNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: 'first name',
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: 'last name',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'adresse',
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () async {
              DateTime? selectedDate = await _selectDate(context);
              if (selectedDate != null) {
                print('birth date: $selectedDate');
              }
            },
            child: IgnorePointer(
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'birth date',
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
                    groupValue: selectedGender.value,
                    onChanged: (Gender? value) {
                      selectedGender.value = value;
                      print('Selected gender: $selectedGender');
                    },
                  )),
              Text('Male'),
              Obx(() => Radio(
                    value: Gender.female,
                    groupValue: selectedGender.value,
                    onChanged: (Gender? value) {
                      selectedGender.value = value;
                      print('Selected gender: $selectedGender');
                    },
                  )),
              Text('Female'),
            ],
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'email',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'phone',
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Identification Type: '),
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
