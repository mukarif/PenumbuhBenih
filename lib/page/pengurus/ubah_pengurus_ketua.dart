import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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

  double _height;
  double _width;
  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _awalDateController = TextEditingController();
  TextEditingController _akhirDontroller = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(
      BuildContext context, TextEditingController _controller) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

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
  void initState() {
    // _dateController.text = DateFormat.yMd().format(DateTime.now());

    // _timeController.text = DateFormat.yMd().format(selectedDate).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
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
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ketua : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formField("Raffi Fahru", kategori, _dropdownValues),
                          _box(10),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tanggal Awal : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formFieldDate("Tanggal Awal", "mm/dd/yyyy",
                              _awalDateController),
                          _box(10),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tanggal Akhir : ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _box(5),
                          _formFieldDate(
                              "Tanggal Akhir", "mm/dd/yyyy", _akhirDontroller),
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

  Widget _formFieldDate(
      String hint, String onChange, TextEditingController controller) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Colors.grey),
        ),
        child: InkWell(
            onTap: () {
              _selectDate(context, controller);
            },
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: controller,
                    onSaved: (String val) {
                      _setDate = val;
                    },
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.only(left: 0),
                      labelStyle: const TextStyle(color: Colors.black54),
                      hintStyle: const TextStyle(color: Colors.black87),
                      hintText: hint,
                      // labelText: label,
                      // border:
                      //     OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.green,
                    size: 15,
                  ),
                ),
              ],
            )),
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
