import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool kelihatan = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'),
                fit: BoxFit.fill)),
        child: formLogin(),
      ),
    );
  }

  Widget formLogin() {
    return Center(
      child: Container(
        width: 536,
        height: 536,
        decoration: const BoxDecoration(
            color: Color(0xFFF6F1F1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            spasi(36),
            templateTeks('SELAMAT DATANG', const Color(0xFF000000), 32),
            spasi(81),
            inputFormBiasa('EMAIL'),
            spasi(42),
            inputFormPassword('PASSWORD'),
            spasi(42),
            tombolKu(),
            spasi(26),
            teksLink(),
          ],
        ),
      ),
    );
  }

  Widget templateTeks(String namaTeksku, Color warnaku, double ukuranku) {
    return Text(namaTeksku,
        style: TextStyle(
            fontSize: ukuranku, fontWeight: FontWeight.w700, color: warnaku));
  }

  Widget spasi(double spasiku) {
    return SizedBox(
      height: spasiku,
    );
  }

  Widget inputFormBiasa(String tulisanku) {
    return Container(
      width: 489,
      height: 70,
      margin: const EdgeInsets.only(left: 23, right: 24),
      padding: const EdgeInsets.only(left: 27, right: 27, top: 21, bottom: 20),
      decoration: const BoxDecoration(
          color: Color(0xFFAFD3E2),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: TextField(
        style: const TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          hintText: tulisanku,
          hintStyle: const TextStyle(fontSize: 24),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget inputFormPassword(String tulisanku) {
    return Container(
      width: 489,
      height: 70,
      margin: const EdgeInsets.only(left: 23, right: 24),
      padding: const EdgeInsets.only(left: 27, right: 27, top: 21, bottom: 20),
      decoration: const BoxDecoration(
          color: Color(0xFFAFD3E2),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: TextField(
        obscureText: kelihatan,
        style: const TextStyle(fontSize: 24, overflow: TextOverflow.ellipsis),
        decoration: InputDecoration(
          hintText: tulisanku,
          hintStyle: const TextStyle(fontSize: 24),
          border: InputBorder.none,
          suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  kelihatan = !kelihatan;
                });
              },
              icon: kelihatan
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined)),
        ),
      ),
    );
  }

  Widget tombolKu() {
    return SizedBox(
      width: 330,
      height: 70,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF146C94),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/homepage');
          },
          child: const Center(
              child: Text('LOGIN',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF))))),
    );
  }

  Widget teksLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Belum Punya Akun ?',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF000000))),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
          child: const Text('Daftar Sekarang',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0029FF))),
        ),
      ],
    );
  }
}
