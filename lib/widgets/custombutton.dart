import 'package:flutter/material.dart';

// class customElevatedButton extends StatelessWidget {
//   final String buttonName;
//   final VoidCallback? onPressed;
//   const customElevatedButton({
//     super.key,
//     required this.buttonName,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: Text(
//         buttonName,
//         style: TextStyle(
//             fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//       ),
//       style: ElevatedButton.styleFrom(
//         fixedSize: const Size(390, 55),
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }
// }

// lib/widgets/custom_button.dart

class CustomButton3 extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const CustomButton3({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(390, 55),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
