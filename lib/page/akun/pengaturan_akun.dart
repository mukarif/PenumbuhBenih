import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengaturanAkun extends StatefulWidget {
  const PengaturanAkun({Key key}) : super(key: key);

  @override
  _PengaturanAkunState createState() => _PengaturanAkunState();
}

class _PengaturanAkunState extends State<PengaturanAkun> {
  GlobalKey<FormState> formAkun = GlobalKey<FormState>();

  TextEditingController nama = TextEditingController();

  String poktan;
  List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Pengaturan Akun",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  _box(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Form(
                      key: formAkun,
                      child: Column(
                        children: [
                          _tff("Sumber Makmur", "Nama", nama),
                          _box(10),
                          _formField("Pilih Gapoktan", poktan, _dropdownValues),
                          _box(10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _box(100),
            const ButtonSimpan(),
            _box(20),
          ],
        ),
      ),
    );
  }

  Widget _tff(String hint, String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        labelStyle: const TextStyle(color: Colors.black54),
        hintStyle: const TextStyle(color: Colors.black87),
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButtonFormField(
          hint: Text(hint),
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

  Widget _box(double tinggi) {
    return SizedBox(
      height: tinggi,
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
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 200,
        child: TextButton(
          child: const Text(
            "Simpan",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
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
            Get.back();
          },
        ),
      ),
    );
  }
}
