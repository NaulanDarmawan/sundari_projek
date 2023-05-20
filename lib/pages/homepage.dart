import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 657,
        width: 1280,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/homepage.jpg'),
                fit: BoxFit.fill)),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(children: [
              header(context),
              content(),
            ]),
          ),
        ),
      ),
    );
  }

  // Header //

  Widget header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 57),
      width: 1280,
      height: 110,
      color: const Color(0xFF05939C),
      child: Row(
        children: [
          teksJudul('Home', 32, () {}),
          spasi(43),

          // Bagian About Us
          teksJudul('Destinasi', 32,
              () => Navigator.pushNamed(context, '/destinasi')),
          spasi(43),
          // ------------ //

          // Bagian Destinasi
          teksJudul(
              'Top Destinasi', 32, () => Navigator.pushNamed(context, '/top')),
          spasi(43),
          // ------------ //

          // Bagian Paling Populer
          teksJudul('Contact US', 32,
              () => Navigator.pushNamed(context, '/aboutpage')),
          spasi(329),
          // ------------ //

          logo(),
        ],
      ),
    );
  }

  Widget teksJudul(String judul, double size, VoidCallback pasDitekan) {
    return Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 32),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: pasDitekan,
          child: Text(judul,
              style: TextStyle(fontSize: size, color: const Color(0xFFFFFFFF))),
        ));
  }

  Widget spasi(double spasiku) {
    return SizedBox(
      width: spasiku,
    );
  }

  Widget logo() {
    return Container(
      width: 135,
      height: 75,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
            image: AssetImage('assets/images/logo.jpg'), fit: BoxFit.fill),
      ),
    );
  }

  // Konten //

  Widget content() {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(
                left: 72, top: 155, right: 61, bottom: 186),
            child: templateTeksStroke('Domestic Destinations\nIn Malang')),
        Container(
            margin: const EdgeInsets.only(top: 72, right: 78, bottom: 99),
            child: animasi()),
      ],
    );
  }

  Widget templateTeksStroke(String teksKu) {
    return SizedBox(
      width: 693,
      height: 206,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Text(teksKu,
                  style: GoogleFonts.jotiOne(
                      textStyle: TextStyle(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.black,
                    fontSize: 64,
                    fontWeight: FontWeight.w400,
                  ))),
              Text(teksKu,
                  style: GoogleFonts.jotiOne(
                      textStyle: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFE07373)))),
            ],
          ),
          Text('Rekomendasi wisata-wisata di Malang',
              style: GoogleFonts.jotiOne(
                  textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF)))),
        ],
      ),
    );
  }

  Widget animasi() {
    return SizedBox(
      width: 376,
      height: 376,
      child: Lottie.asset('assets/animations/home.json'),
    );
  }
}
