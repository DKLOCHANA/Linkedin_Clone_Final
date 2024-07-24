import 'package:flutter/material.dart';
import 'package:linkedin/core/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:linkedin/viewmodels/auth_view_model.dart';

import 'package:linkedin/widgets/custom_form_field.dart';
import 'package:linkedin/widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

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
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/image2.png'),
                  const SizedBox(height: 10),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('or',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16)),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, '/register'),
                        child: const Text(
                          ' Join LinkedIn',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Palette.buttonColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Stay updated on your professional world',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormField(
                          labelText: 'E-mail or Phone',
                          controller: usernameController,
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          labelText: 'Password',
                          controller: passwordController,
                          obscureText: _obscureText,
                          showToggle: true,
                          toggleVisibility: _togglePasswordVisibility,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Palette.buttonColor),
                        ),
                        const SizedBox(height: 20),
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
                                  const SnackBar(
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
