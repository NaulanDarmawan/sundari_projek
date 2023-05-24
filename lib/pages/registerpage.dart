import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool kelihatan = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/register.jpg'),
                fit: BoxFit.fill)),
        child: formLogin(),
      ),
    );
  }

  Widget formLogin() {
    return Center(
      child: Form(
        key: formKey,
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
              inputFormBiasa('EMAIL', emailController),
              spasi(42),
              inputFormPassword('PASSWORD', passwordController),
              spasi(42),
              tombolKu(),
              spasi(26),
              teksLink(),
            ],
          ),
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

  Widget inputFormBiasa(String tulisanku, TextEditingController controller) {
    return Container(
      width: 489,
      height: 70,
      margin: const EdgeInsets.only(left: 23, right: 24),
      padding: const EdgeInsets.only(left: 27, right: 27, top: 21, bottom: 20),
      decoration: const BoxDecoration(
          color: Color(0xFFAFD3E2),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: TextFormField(
        controller: controller,
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

  Widget inputFormPassword(String tulisanku, TextEditingController controller) {
    return Container(
      width: 489,
      height: 70,
      margin: const EdgeInsets.only(left: 23, right: 24),
      padding: const EdgeInsets.only(left: 27, right: 27, top: 21, bottom: 20),
      decoration: const BoxDecoration(
          color: Color(0xFFAFD3E2),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: TextFormField(
        controller: controller,
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
            if (formKey.currentState!.validate()) {
              if (emailController.text == 'Sundari' &&
                  passwordController.text == 'Sundari') {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Akun Anda Telah Berhasil Terdaftar')));
                Navigator.pushReplacementNamed(context, '/');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Anda Gagal Masuk')));
              }
            }
          },
          child: const Center(
              child: Text('REGISTER',
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
        const Text('Sudah Punya Akun ?',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF000000))),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
          child: const Text('Login Sekarang',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0029FF))),
        ),
      ],
    );
  }
}
