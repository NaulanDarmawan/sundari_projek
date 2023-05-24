import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget header() {
    //   return Container(
    //     width: 1280,
    //     height: 164,
    //     color: const Color(0xFFD9D9D9),
    //     child: Row(
    //       children: [
    //         Container(
    //           margin: const EdgeInsets.only(left: 47, right: 228),
    //           width: 94,
    //           height: 79,
    //           child: IconButton(
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //               icon: Image.asset('assets/images/kembali.png')),
    //         ),
    //         const Center(
    //           child: Text('Destinations',
    //               style: TextStyle(fontSize: 96, fontWeight: FontWeight.w400)),
    //         )
    //       ],
    //     ),
    //   );
    // }

    Widget content() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/contact_page.png'),
                  fit: BoxFit.cover)),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          // header(),
          content(),
        ],
      ),
    );
  }
}
