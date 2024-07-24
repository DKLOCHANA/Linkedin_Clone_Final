import 'package:flutter/material.dart';

class customSearchBox extends StatelessWidget {
  final String hintText;
  const customSearchBox({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(0),
        ),
        fillColor: Color(0xFFEDF3F8),
        filled: true,
      ),
    );
  }
}
