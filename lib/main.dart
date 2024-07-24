import 'package:flutter/material.dart';
import 'package:linkedin/core/theme.dart';
import 'package:linkedin/mainpage.dart';
import 'package:linkedin/viewmodels/carousel_view_model.dart';
import 'package:linkedin/viewmodels/posts_view_model.dart';
import 'package:linkedin/viewmodels/profile_private_view_model.dart';
import 'package:linkedin/viewmodels/profile_view_model.dart';
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LinkedIn Clone',
      theme: customTheme,
      home: const RegisterView(),
      routes: {
        '/register': (context) => const RegisterView(),
        '/login': (context) => const LoginView(),
        '/home': (context) => const Mainpage(),
        '/profile': (context) => const ProfileView(),
      },
    );
  }
}
