import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? prefix_icon;
  final IconData? suffix_icon;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField(
      {Key? key,
      required this.label,
      required this.prefix_icon,
      required this.suffix_icon,
      required this.validator,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Digite o $label',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: prefix_icon == null ? null : Icon(prefix_icon),
        suffixIcon: suffix_icon == null ? null : Icon(suffix_icon)
      ),
    );
  }
}
