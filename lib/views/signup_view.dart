// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:linkedin/core/theme/app_colors.dart';
import 'package:linkedin/viewmodels/signup_view_model.dart';

import 'package:linkedin/widgets/custom_form_field.dart';
import 'package:linkedin/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:linkedin/viewmodels/auth_view_model.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final SignupViewModel viewModel = SignupViewModel();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/image2.png'),
              SizedBox(height: 10),
              Text(
                'Join LinkedIn',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('or',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                    child: Text(
                      ' Sign in',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Palette.buttonColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail', style: TextStyle(fontSize: 16)),
                    CustomFormField(
                      labelText: 'E-mail',
                      controller: usernameController,
                      showLabelText: false,
                      validator: (value) => viewModel.validateEmail(value),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Password (6 characters minimum)',
                      style: TextStyle(fontSize: 16),
                    ),
                    CustomFormField(
                      controller: passwordController,
                      labelText: 'Password',
                      obscureText: _obscureText,
                      showLabelText: false,
                      validator: (value) => viewModel.validatePassword(value),
                      showToggle: true,
                      toggleVisibility: _togglePasswordVisibility,
                    ),
                    SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            'By clicking Accept and Register, you agree to the ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Terms of Use',
                            style: TextStyle(color: Palette.buttonColor),
                          ),
                          TextSpan(text: ', the '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Palette.buttonColor,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Cookies Policy',
                            style: TextStyle(color: Palette.buttonColor),
                          ),
                          TextSpan(text: ' LinkedIn.'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      buttonName: 'Accept and Register',
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final username = usernameController.text;
                          final password = passwordController.text;

                          Provider.of<AuthViewModel>(context, listen: false)
                              .register(username, password);
                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
