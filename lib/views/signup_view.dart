import 'package:flutter/material.dart';
import 'package:linkedin/views/login_view.dart';
import 'package:linkedin/widgets/customField.dart';
import 'package:linkedin/widgets/custombutton.dart';
import 'package:provider/provider.dart';
import 'package:linkedin/viewmodels/auth_view_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              SizedBox(height: 20),
              Text(
                'Join LinkedIn',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('or',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ),
                    child: Text(
                      ' Sign in',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue),
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
                    Text('E-mail'),
                    CustomFormField(
                      labelText: 'E-mail',
                      controller: usernameController,
                      showLabelText: false,
                    ),
                    SizedBox(height: 15),
                    Text('Password (6 characters minimum)'),
                    CustomFormField(
                      controller: passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      showLabelText: false,
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
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(text: ', the '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Cookies Policy',
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(text: ' LinkedIn.'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton3(
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
