import 'package:flutter/material.dart';

class CustomSearchBox extends StatelessWidget {
  final String hintText;
  const CustomSearchBox({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(0),
        ),
        fillColor: const Color(0xFFEDF3F8),
        filled: true,
      ),
    );
  }
}
