import 'package:flutter/material.dart';

// class customField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;

//   const customField({
//     super.key,
//     required this.hintText,
//     required this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: hintText,
//         contentPadding: EdgeInsets.all(20),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Pallete.borderColor,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Pallete.borderColor,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/customField.dart

// class PasswordField extends StatefulWidget {
//   final TextEditingController controller;

//   const PasswordField({Key? key, required this.controller}) : super(key: key);

//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }

// class _PasswordFieldState extends State<PasswordField> {
//   bool _obscureText = true;

//   void _toggleObscureText() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: widget.controller,
//       obscureText: _obscureText,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         border: OutlineInputBorder(),
//         suffix: TextButton(
//           onPressed: _toggleObscureText,
//           child: Text(
//             _obscureText ? 'Show' : 'Hide',
//             style: TextStyle(color: Colors.blue),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class customField2 extends StatelessWidget {
//   final String labelText;
//   final TextEditingController controller;
//   const customField2(
//       {super.key, required this.labelText, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           labelText,
//           style: TextStyle(fontSize: 14),
//         ),
//         SizedBox(height: 6),
//         TextFormField(
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.all(20),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Pallete.borderColor,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Pallete.borderColor,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// // lib/widgets/customField.dart

// class CustomField2 extends StatelessWidget {
//   final String labelText;
//   final TextEditingController controller;

//   const CustomField2({
//     Key? key,
//     required this.labelText,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool showLabelText;
  final bool obscureText;

  const CustomFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.showLabelText = true,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: showLabelText ? labelText : null,
        contentPadding: EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please enter a $labelText')),
            );
          });
          return null;
        }
        return null;
      },
    );
  }
}
