// // lib/views/login_view.dart
// import 'package:flutter/material.dart';
// import 'package:linkedin/views/signup_view.dart';
// import 'package:provider/provider.dart';
// import 'package:linkedin/viewmodels/auth_view_model.dart';
// import 'package:linkedin/widgets/customField.dart';
// import 'package:linkedin/widgets/custombutton.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Consumer<AuthViewModel>(
//         builder: (context, viewModel, child) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset('assets/images/image2.png'),
//                   SizedBox(height: 20),
//                   Text(
//                     'Sign In',
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 3),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text('or',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400, fontSize: 16)),
//                       GestureDetector(
//                         onTap: () => Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(
//                               builder: (context) => const SignupPage()),
//                         ),
//                         child: Text(
//                           ' Join LinkedIn',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                               color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Stay updated on your professional world',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//                   ),
//                   SizedBox(height: 20),
//                   CustomField2(
//                     //hintText: 'Email or Phone',
//                     controller: _emailController, labelText: 'Email',
//                   ),
//                   SizedBox(height: 10),
//                   PasswordField(
//                     controller: _passwordController,
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Forgot Password?',
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue),
//                   ),
//                   SizedBox(height: 20),
//                   CustomButton3(
//                     buttonName: 'Sign In',
//                     onPressed: () {
//                       final email = _emailController.text;
//                       final password = _passwordController.text;
//                       viewModel.onLoginButtonPressed(context, email, password);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
