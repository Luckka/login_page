import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.obscureText = false})
      : super(key: key);

  final String label;
  final Function(String value) onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
