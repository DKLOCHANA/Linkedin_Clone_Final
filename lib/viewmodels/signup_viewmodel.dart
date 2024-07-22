// // lib/viewmodels/signup_view_model.dart
// import 'package:flutter/material.dart';
// import 'package:linkedin/models/user.dart';
// import '../views/login_view.dart';

// class SignupViewModel extends ChangeNotifier {
//   String? _emailError;
//   String? _passwordError;
//   String? _generalError;
//   UserData? _userData; // Make this non-final

//   String? get emailError => _emailError;
//   String? get passwordError => _passwordError;
//   String? get generalError => _generalError;
//   UserData? get userData => _userData; // Provide a getter for user data

//   bool validate(String email, String password) {
//     bool isValid = true;
//     _emailError = null;
//     _passwordError = null;
//     _generalError = null;

//     if (email.isEmpty) {
//       _emailError = 'Email cannot be empty';
//       isValid = false;
//     } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
//       _emailError = 'Invalid email format';
//       isValid = false;
//     }

//     if (password.isEmpty) {
//       _passwordError = 'Password cannot be empty';
//       isValid = false;
//     } else if (password.length < 6) {
//       _passwordError = 'Password must be at least 6 characters';
//       isValid = false;
//     }

//     notifyListeners();
//     return isValid;
//   }

//   void registerUser(String email, String password) {
//     // Save user data to memory
//     _userData = UserData(email: email, password: password);
//     _generalError = null;

//     notifyListeners();
//   }

//   void onRegisterButtonPressed(
//     BuildContext context,
//     String email,
//     String password,
//   ) {
//     if (validate(email, password)) {
//       registerUser(email, password);
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     } else {
//       if (emailError != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(emailError!)),
//         );
//       } else if (passwordError != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(passwordError!)),
//         );
//       }
//     }
//   }
// }
