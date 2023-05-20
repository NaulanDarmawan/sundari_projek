import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wisata/widgets/detail_destinasi.dart';

class DestinasiPage extends StatefulWidget {
  const DestinasiPage({super.key});

  @override
  State<DestinasiPage> createState() => _DestinasiPageState();
}

class _DestinasiPageState extends State<DestinasiPage> {
  List _dataDestinasi = [];

  Future getDataDestinasi() async {
    try {
      final response =
          await http.get(Uri.parse("http://localhost:8000/api/destinasi"));

      if (response.statusCode == 200) {
        final apiDestinasi = jsonDecode(response.body)['data']['item']['data'];
        setState(() {
          _dataDestinasi = apiDestinasi;
        });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Center(child: Text(e.toString())),
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
    getDataDestinasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFD0C9C9),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFeecda3), Color(0xFFef629f)],
        )),
        child: ListView(
          children: [
            header(),
            GridView.builder(
              itemCount: _dataDestinasi.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              // Total Data Kesamping, Jika lebih maka otomatis ke bawah sendiri
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              // -------------------------------------------------------

              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(left: 26, right: 26),
                  margin: const EdgeInsets.only(right: 63, left: 63, top: 80),
                  width: 338,
                  height: 275,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      spasi(32),
                      gambar(
                          'http://localhost:8000/storage/posts/${_dataDestinasi[index]['gambar']}'),
                      spasi(20),
                      judul('${_dataDestinasi[index]['judul']}'),
                      spasi(25),
                      tombol(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailDestinasi(
                            gambar:
                                'http://localhost:8000/storage/posts/${_dataDestinasi[index]['gambar']}',
                            judul: '${_dataDestinasi[index]['judul']}',
                            lokasi: '${_dataDestinasi[index]['lokasi']}',
                            deskripsi: '${_dataDestinasi[index]['deskripsi']}',
                          );
                        }));
                      }),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      width: 1280,
      height: 164,
      color: const Color(0xFFD9D9D9),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 47, right: 228),
            width: 94,
            height: 79,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset('assets/images/kembali.png')),
          ),
          const Center(
            child: Text('Destinations',
                style: TextStyle(fontSize: 96, fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }

  Widget spasi(double tinggi) {
    return SizedBox(
      height: tinggi,
    );
  }

  Widget gambar(String linkGambar) {
    return SizedBox(
      width: 291,
      height: 132,
      child: Image.network(linkGambar, fit: BoxFit.fill),
    );
  }

  Widget judul(String judul) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(judul,
          maxLines: 1,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
    );
  }

  Widget tombol(VoidCallback pasDitekan) {
    return SizedBox(
      width: 291,
      height: 52,
      child: ElevatedButton(
          onPressed: pasDitekan,
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF29CDB0)),
          child: const Center(
              child: Text('Lihat',
                  style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.w400)))),
    );
  }
}
