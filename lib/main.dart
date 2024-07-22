import 'package:flutter/material.dart';
import 'package:linkedin/mainpage.dart';
import 'package:linkedin/viewmodels/carousel_view_model.dart';
import 'package:linkedin/viewmodels/posts_view_model.dart';
import 'package:linkedin/viewmodels/profile_private_view_model.dart';
import 'package:linkedin/viewmodels/profile_viewmodel.dart';
import 'package:linkedin/views/profile_view.dart';
import 'package:provider/provider.dart';
import 'viewmodels/auth_view_model.dart';
import 'package:linkedin/views/signup_view.dart';
import 'views/login_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => PostsViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => ProfilePrivateViewModel()),
        ChangeNotifierProvider(create: (_) => CarouselViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LinkedIn Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegisterPage(),
      routes: {
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => Mainpage(),
        '/profile': (context) => ProfileView(),
      },
    );
  }
}
