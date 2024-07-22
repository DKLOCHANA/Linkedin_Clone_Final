// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:linkedin/viewmodels/auth_view_model.dart';
import 'package:linkedin/views/signup_view.dart';
import 'package:linkedin/widgets/customField.dart';
import 'package:linkedin/widgets/custombutton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                  SizedBox(height: 20),
                  Text(
                    'Sign In',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('or',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16)),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        ),
                        child: Text(
                          ' Join LinkedIn',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
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
                          labelText: 'E-mail',
                          controller: usernameController,
                        ),
                        SizedBox(height: 10),
                        CustomFormField(
                          labelText: 'Password',
                          controller: passwordController,
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        SizedBox(height: 20),
                        CustomButton3(
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
                                        content: Text('Invalid credentials')));
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
