import 'package:flutter/material.dart';
import 'package:wisata/pages/contactpage.dart';
import 'package:wisata/pages/homepage.dart';
import 'package:wisata/pages/registerpage.dart';
import 'package:wisata/pages/topdestinasipage.dart';

import 'pages/destinasipage.dart';
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
        '/destinasi': (context) => const DestinasiPage(),
        '/top': (context) => const TopDestinasiPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
