// // lib/viewmodels/login_view_model.dart
// import 'package:flutter/material.dart';
// import 'package:linkedin/mainpage.dart';
// import 'package:linkedin/viewmodels/signup_viewmodel.dart';

// import 'package:provider/provider.dart';

// class LoginViewModel extends ChangeNotifier {
//   String? _emailError;
//   String? _passwordError;
//   String? _generalError;

//   String? get emailError => _emailError;
//   String? get passwordError => _passwordError;
//   String? get generalError => _generalError;

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
//     }

//     notifyListeners();
//     return isValid;
//   }

//   void loginUser(
//     BuildContext context,
//     String email,
//     String password,
//   ) {
//     final signupViewModel =
//         Provider.of<SignupViewModel>(context, listen: false);

//     // Validate credentials with stored user data
//     if (signupViewModel.userData == null) {
//       _generalError = 'No registered user found';
//     } else if (signupViewModel.userData!.email != email ||
//         signupViewModel.userData!.password != password) {
//       _generalError = 'Invalid email or password';
//     } else {
//       _generalError = null;
//     }

//     if (generalError == null) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => Mainpage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(generalError!)),
//       );
//     }
//   }
// }
