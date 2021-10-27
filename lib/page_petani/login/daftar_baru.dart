import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/page_petani/login/login.dart';

class DaftarBaru extends StatefulWidget {
  const DaftarBaru({Key key}) : super(key: key);

  @override
  _DaftarBaruState createState() => _DaftarBaruState();
}

class _DaftarBaruState extends State<DaftarBaru> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nama = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController repass = TextEditingController();

  String jk;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String desa;
  String poktan;

  List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg_hijau.png"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/row_putih.png",
                      width: Get.width * 0.7,
                      height: 80,
                      // fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Daftar Baru",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Lengkapi isian berikut sesuai judul form",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            _tff("Nama Lengkap", "Nama Lengkap", nama),
                            _box(),
                            _tff("NIK", "NIK", nik),
                            _box(),
                            _formField("Jenis kelamin", jk, _dropdownValues),
                            _box(),
                            _tff("Alamat lengkap", "Alamat lengkap", alamat),
                            _box(),
                            _formField("Provinsi", provinsi, _dropdownValues),
                            _box(),
                            _formField(
                                "Kabupaten/Kota", kabupaten, _dropdownValues),
                            _box(),
                            _formField("Kecamatan", kecamatan, _dropdownValues),
                            _box(),
                            _formField("Desa", desa, _dropdownValues),
                            _box(),
                            _formField(
                                "Pilih kelompok tani", poktan, _dropdownValues),
                            _box(),
                            const Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                            _box(),
                            _tff("Username", "Username", username),
                            _box(),
                            _tff("Email", "Email", email),
                            _box(),
                            _tff("Password", "Password", pass),
                            _box(),
                            _tff("Ulangi password", "Ulangi password", repass),
                            _box(),
                            const SizedBox(
                              height: 20,
                            ),
                            const ButtonSimpan(),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Sudah punya Akun?  ",
                                  style: TextStyle(color: Colors.white60),
                                ),
                                InkWell(
                                  child: const Text(
                                    "Masuk",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  onTap: () {
                                    Get.offAll(() => const LoginPage());
                                  },
                                )
                              ],
                            ),
                            _box(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tff(String hint, String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
        hintText: hint,
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onSaved: (value) {
        controller.text = value;
      },
    );
  }

  Widget _formField(String hint, String onChange, List<String> list) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: DropdownButtonFormField(
          iconEnabledColor: Colors.white,
          hint: Text(
            hint,
            style: const TextStyle(color: Colors.white),
          ),
          dropdownColor: Colors.white,
          items: list
              .map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  ))
              .toList(),
          onChanged: (String value) {
            setState(() {
              onChange = value;
              print(onChange);
            });
          },
          // isExpanded: false,
          value: onChange,
        ),
      ),
    );
  }

  Widget _box() {
    return const SizedBox(
      height: 10,
    );
  }
}

class ButtonSimpan extends StatelessWidget {
  const ButtonSimpan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: SizedBox(
        width: 200,
        child: TextButton(
          child: const Text(
            "Daftar Baru",
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ),
          onPressed: () {
            Get.to(() => const LoginPage());
          },
        ),
      ),
    );
  }
}
