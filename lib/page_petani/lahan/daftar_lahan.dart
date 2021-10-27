import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petani/page_petani/lahan/lahan.dart';

class DaftarLahanBaru extends StatefulWidget {
  const DaftarLahanBaru({Key key}) : super(key: key);

  @override
  _DaftarLahanBaruState createState() => _DaftarLahanBaruState();
}

class _DaftarLahanBaruState extends State<DaftarLahanBaru> {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();
  TextEditingController luasLahan = TextEditingController();
  TextEditingController namaLahan = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  String _status;
  String _provinsi;
  String _kabKot;
  String _kecamatan;
  String _desa;

  File _selectedImage;
  final picker = ImagePicker();

  Widget getImageWidget() {
    if (_selectedImage != null) {
      return Image.file(
        _selectedImage,
        width: 400,
        height: 300,
        fit: BoxFit.cover,
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }

  getImage(ImageSource source) async {
    final image = await picker.getImage(
      source: ImageSource.camera,
      maxHeight: 1920,
      maxWidth: 1080,
      imageQuality: 96,
    );
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    } else {
      print("Foto Kosong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Daftarkan Lahan Baru",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: const Center(
                    child: Text(
                      'Google MAPS',
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey[200], spreadRadius: 3),
                    ],
                  ),
                  height: 200,
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: formLahan,
                  child: Column(
                    children: [
                      _tff("Luas", "Luas", luasLahan),
                      _box(10),
                      _tff("Nama Lahan", "Nama Lahan", namaLahan),
                      _box(10),
                      _formField(
                          "Status kepemilikan", _status, _dropdownValues),
                      _box(10),
                      _formField("Provinsi", _provinsi, _dropdownValues),
                      _box(10),
                      _formField("Kabupaten/Kota", _kabKot, _dropdownValues),
                      _box(10),
                      _formField("Kecamatan", _kecamatan, _dropdownValues),
                      _box(10),
                      _formField("Desa", _desa, _dropdownValues),
                      _box(10),
                      _tff("Keterangan", "Keterangan", keterangan),
                      _box(10),
                      _selectedImage == null ? _box(0) : _box(5),
                      getImageWidget(),
                      _selectedImage == null ? _box(0) : _box(10),
                      _selectedImage == null
                          ? _box(0)
                          : TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              child: const Text("Hapus Foto"),
                              onPressed: () {
                                setState(() {
                                  _selectedImage = null;
                                });
                              },
                            ),
                      _selectedImage == null ? _box(0) : _box(10),
                      GestureDetector(
                        onTap: () {
                          getImage(ImageSource.camera);
                        },
                        child: Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25))),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(19, 15, 10, 5),
                            child: Text(
                              "Foto",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ButtonSimpan(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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

  Widget _box(double h) {
    return SizedBox(
      height: h,
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
            Get.to(() => const DaftarLahan());
          },
        ),
      ),
    );
  }
}
