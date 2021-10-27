import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LaporanGanggguan extends StatefulWidget {
  const LaporanGanggguan({Key key}) : super(key: key);

  @override
  _LaporanGanggguanState createState() => _LaporanGanggguanState();
}

class _LaporanGanggguanState extends State<LaporanGanggguan> {
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
                      "Lapor Gangguan",
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
                          _formField("Kategori", kategori, _dropdownValues),
                          _box(10),
                          _formField("Tanaman", tanaman, _dropdownValues),
                          _box(10),
                          _tff("Deskripsi", "Deskripsi Gangguan", deskripsi),
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
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                  child: Text("Hapus Foto"),
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
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(19, 15, 10, 5),
                                child: Text(
                                  "Foto Pendukung",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
                          _box(10),
                          const ButtonSimpan(),
                          _box(10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: const [
                    Text(
                      "Riwayat Laporan",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                        child: GestureDetector(
                          onTap: () {
                            print("pressed riwayat laporan");
                          },
                          child: Container(
                            height: 130,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Raffi - Petani",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "10 Okt 21:22",
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      _box(10),
                                      const Text(
                                        "Terjadi gangguan pada batang tanaman dimana terdapat bintik-bintik putih",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Divider(
                                        height: 10,
                                        color: Colors.grey[600],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {
                                                print("You pressed suka");
                                              },
                                              child: const Text(
                                                "Suka(1)",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {
                                                print("You pressed balasan");
                                              },
                                              child: const Text(
                                                "Balasan(1)",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
            "Kirim Laporan",
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
            print("Presses kirim laporan");
          },
        ),
      ),
    );
  }
}
