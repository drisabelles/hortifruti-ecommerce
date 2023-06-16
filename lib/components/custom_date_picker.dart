import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDatePicker extends StatelessWidget {

  final TextEditingController controller;
  final String? label;
  final String hint;
  final VoidCallback callback;

  const CustomDatePicker(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hint,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: Icon(Icons.calendar_month),
        labelText: label,
        hintText: hint,
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Esse campo deve ser preenchido';
        }
      },
      onTap: callback,
    );  
  }
}

