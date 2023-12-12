import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_stepform/controller/steps_contoller.dart';
import 'package:get/get.dart';

class StepAcademic extends StatelessWidget {
  final TextEditingController cardIdController;
  final TextEditingController universityController;
  final TextEditingController classController;

  StepAcademic({
    required this.cardIdController,
    required this.universityController,
    required this.classController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: cardIdController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'Card ID',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: universityController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'University',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: classController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'Class',
            ),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              labelText: 'Proof',
            ),
            items: ['شهادة ترسيم', 'student card', 'شهادة حضور', 'other']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {},
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Pick Image'),
          ),
          SizedBox(height: 10),
          // Display selected image
          GetBuilder<StepsController>(
            builder: (controller) {
              return controller.image.value != null
                  ? Image.file(
                      File(controller.image.value!.path),
                      height: 100, // Adjust the height as needed
                    )
                  : SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}