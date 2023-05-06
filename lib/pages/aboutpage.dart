import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 657,
        width: 1280,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/sekolah.jpeg'),
                fit: BoxFit.fill)),
        child: ClipRRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Column(children: [
                header(context),
                spasi(67),
                conten(),
              ])),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      height: 170,
      width: 1280,
      color: Color(0xFFF0A4A4),
      child: Row(
        children: [
          logo(context),
          judul('About Us'),
        ],
      ),
    );
  }

  // Header //

  Widget judul(String nama) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 15),
        child: Text(nama,
            style: const TextStyle(fontSize: 128, color: Color(0xFF000000))));
  }

  Widget logo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(top: 45, left: 55, bottom: 46, right: 229),
        width: 94,
        height: 79,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/kembali.png'), fit: BoxFit.fill),
        ),
      ),
    );
  }

  // Konten //
  Widget conten() {
    return Container(
      margin: EdgeInsets.only(right: 150, left: 150),
      width: 981,
      height: 307,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Text(
                  'SMKN 8 Malang adalah sekolahan yang memiliki empat\nprogram keahlian yang bisa kalian pilih. Keempat\nprogram keahlian ini saling berkaitan satu sama lain.\nSehingga dengan dukungan guru-guru kami yang up-\nto-date nantinya kalian bisa mempelajarinya.',
                  style: GoogleFonts.karma(
                      textStyle: TextStyle(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ))),
              Text(
                  'SMKN 8 Malang adalah sekolahan yang memiliki empat\nprogram keahlian yang bisa kalian pilih. Keempat\nprogram keahlian ini saling berkaitan satu sama lain.\nSehingga dengan dukungan guru-guru kami yang up-\nto-date nantinya kalian bisa mempelajarinya.',
                  style: GoogleFonts.karma(
                      textStyle: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFE07373)))),
            ],
          ),
        ],
      ),
    );
  }

  Widget spasi(double spasiku) {
    return SizedBox(
      height: spasiku,
    );
  }
}
