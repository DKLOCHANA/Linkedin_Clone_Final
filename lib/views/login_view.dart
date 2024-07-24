// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:linkedin/core/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:linkedin/viewmodels/auth_view_model.dart';

import 'package:linkedin/widgets/custom_form_field.dart';
import 'package:linkedin/widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/image2.png'),
                  SizedBox(height: 10),
                  Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('or',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16)),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, '/register'),
                        child: Text(
                          ' Join LinkedIn',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Palette.buttonColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Stay updated on your professional world',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormField(
                          labelText: 'E-mail or Phone',
                          controller: usernameController,
                        ),
                        SizedBox(height: 10),
                        CustomFormField(
                          labelText: 'Password',
                          controller: passwordController,
                          obscureText: _obscureText,
                          showToggle: true,
                          toggleVisibility: _togglePasswordVisibility,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Palette.buttonColor),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          buttonName: 'Sign In',
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final username = usernameController.text;
                              final password = passwordController.text;

                              final isValid = Provider.of<AuthViewModel>(
                                      context,
                                      listen: false)
                                  .login(username, password);
                              if (isValid) {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Invalid credentials'),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
