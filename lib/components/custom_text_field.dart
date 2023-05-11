import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData? icon;
  final Widget? suffix;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField(
      {Key? key,
      required this.label,
      required this.obscureText,
      required this.icon,
      this.suffix,
      required this.validator,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Digite o $label',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: icon == null ? null : Icon(icon),
        suffixIcon: suffix
      ),
    );
  }
}
