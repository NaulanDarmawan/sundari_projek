import 'package:flutter/material.dart';
import 'package:wisata/pages/aboutpage.dart';
import 'package:wisata/pages/homepage.dart';
import 'package:wisata/pages/registerpage.dart';

import 'pages/loginpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/homepage': (context) => const HomePage(),
        '/aboutpage': (context) => const AboutPage(),
      },
    );
  }
}
