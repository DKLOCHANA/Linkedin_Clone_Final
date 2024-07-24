import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool showLabelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool? showToggle;
  final VoidCallback? toggleVisibility;

  const CustomFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.showLabelText = true,
    this.obscureText = false,
    this.validator,
    this.showToggle,
    this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: showLabelText ? labelText : null,
        contentPadding: EdgeInsets.all(10),
        suffixIcon: showToggle == true
            ? TextButton(
                onPressed: toggleVisibility,
                child: Text(obscureText ? 'SHOW' : 'HIDE'),
              )
            : null,
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}
