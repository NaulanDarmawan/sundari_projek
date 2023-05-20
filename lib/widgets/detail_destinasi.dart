import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailDestinasi extends StatefulWidget {
  String gambar;
  String judul;
  String lokasi;
  String deskripsi;
  DetailDestinasi(
      {super.key,
      required this.gambar,
      required this.judul,
      required this.lokasi,
      required this.deskripsi});

  @override
  State<DetailDestinasi> createState() => _DetailDestinasiState();
}

class _DetailDestinasiState extends State<DetailDestinasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFAC60),
      body: Padding(padding: const EdgeInsets.all(32), child: konten()),
    );
  }

  Widget konten() {
    return Container(
      width: 1221,
      height: 594,
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          konten1(),
          spasi(33),
          konten2(),
        ],
      ),
    );
  }

  Widget konten1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gambar(),
        tulisan(),
        tombol(),
      ],
    );
  }

  Widget konten2() {
    return Container(
      margin: const EdgeInsets.only(left: 31, right: 16, bottom: 14),
      width: 1174,
      height: 206,
      child: Image.asset('assets/images/footer.png'),
    );
  }

  Widget gambar() {
    return Container(
      margin: const EdgeInsets.only(top: 43, left: 37, right: 49),
      width: 500,
      height: 284,
      child: Image.network(widget.gambar, fit: BoxFit.fill),
    );
  }

  Widget tulisan() {
    return Column(
      children: [
        spasi(50),
        AutoSizeText(widget.judul,
            maxFontSize: 64,
            minFontSize: 50,
            maxLines: 1,
            style: GoogleFonts.karma(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400, color: Color(0xFF000000)))),
        spasi(5),
        AutoSizeText(widget.lokasi,
            minFontSize: 20,
            maxLines: 1,
            style: GoogleFonts.karma(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w300, color: Color(0xFF000000)))),
        spasi(18),
        Container(
          width: 560,
          height: 17,
          color: const Color(0xFFF88D8D),
        ),
        spasi(24),
        SizedBox(
          width: 542,
          height: 118,
          child: AutoSizeText(widget.deskripsi,
              minFontSize: 16,
              maxLines: 5,
              style: GoogleFonts.karma(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w300, color: Color(0xFF000000)))),
        ),
      ],
    );
  }

  Widget spasi(double ukuran) {
    return SizedBox(
      height: ukuran,
    );
  }

  Widget tombol() {
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 5),
      width: 65,
      height: 65,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('assets/images/keluar.png', fit: BoxFit.cover)),
    );
  }
}
