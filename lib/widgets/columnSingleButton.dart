import 'package:flutter/material.dart';

class ColumnSingleButton extends StatelessWidget {
  final String name;
  final String iconImage;
  final Color color;

  const ColumnSingleButton({
    super.key,
    required this.name,
    required this.iconImage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(iconImage, color: color),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }
}
