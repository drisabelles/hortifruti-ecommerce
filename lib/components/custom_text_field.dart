import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? label;
  final String hint;
  final IconData? icon;
  final Widget? suffix;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField(
      {Key? key,
      this.inputFormatters,
      this.keyboardType,
      required this.obscureText,
      required this.label,
      required this.hint,
      required this.icon,
      this.suffix,
      required this.validator,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText, 
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: label,
        hintText: hint,
        prefixIcon: icon == null ? null : Icon(icon),
        suffixIcon: suffix
      ),
      validator: validator,
      onSaved: onSaved
    );  
  }
}
