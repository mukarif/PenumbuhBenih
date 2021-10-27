import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petani/page/alsintan/alsintan.dart';
import 'package:petani/page/lahan/daftar_lahan.dart';

class TambahAlsintanBaru extends StatefulWidget {
  const TambahAlsintanBaru({Key key}) : super(key: key);

  @override
  _TambahAlsintanBaruState createState() => _TambahAlsintanBaruState();
}

class _TambahAlsintanBaruState extends State<TambahAlsintanBaru> {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();
  TextEditingController luasLahan = TextEditingController();
  TextEditingController namaLahan = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController nameController = TextEditingController();

  int _radioValue = 0;

  List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  String _petani;
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
                  "Tambah Alsintan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formLahan,
                  child: Column(
                    children: [
                      _tff("Nama Alsintan", "Nama Alsintan", luasLahan),
                      _box(10),
                      _tff("Merk", "Merk", namaLahan),
                      _box(10),
                      _formField("Kategori", _petani, _dropdownValues),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25))),
                            child: Row(
                              children: const [
                                Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 19),
                                    child: Text(
                                      "Foto Pendukung",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 24),
                                    child: Icon(
                                      Icons.attach_file,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      _box(10),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          const Text(
                            'Disewakan',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          const Text(
                            'Tidak Disewakan',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      _tff("Harga Sewa", "Harga Sewa", luasLahan),
                      _box(10),
                      _formField("Satuan", _petani, _dropdownValues),
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

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
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
            Get.to(() => const AlsintanPage());
          },
        ),
      ),
    );
  }
}
