import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petani/page/ringkasan/ringkasan.dart';

class UbahPengurus extends StatefulWidget {
  const UbahPengurus({Key key}) : super(key: key);

  @override
  _UbahPengurusState createState() => _UbahPengurusState();
}

class _UbahPengurusState extends State<UbahPengurus> {
  GlobalKey<FormState> formLaporanGanggguan = GlobalKey<FormState>();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController foto = TextEditingController();

  List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  String kategori;
  String tanaman;

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Pengaturan Pengurus",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formLaporanGanggguan,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Ketua : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formField("Raffi Fahru", kategori, _dropdownValues),
                          _box(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Wakil Ketua : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formField("Faris", tanaman, _dropdownValues),
                          _box(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Sekertaris 1 : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formField("Haryanto", tanaman, _dropdownValues),
                          _box(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Sekertaris 2 : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formField("Susetyo", tanaman, _dropdownValues),
                          _box(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Bendahara 1 : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formField("Sutono", tanaman, _dropdownValues),
                          _box(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Bendahara 2 : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formField("Pilih Anggota", tanaman, _dropdownValues),
                          _box(10),
                          const ButtonSimpan(),
                          _box(10),
                        ],
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
        width: 150,
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
            print("Presses Simpan Perubahan Pengurus");
            Get.to(() => const RingkasanPage());
          },
        ),
      ),
    );
  }
}
