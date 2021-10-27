import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailAlsintan extends StatefulWidget {
  const DetailAlsintan({Key key}) : super(key: key);

  @override
  _DetailAlsintanState createState() => _DetailAlsintanState();
}

class _DetailAlsintanState extends State<DetailAlsintan> {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();
  GlobalKey<FormState> formJual = GlobalKey<FormState>();
  TextEditingController hrgaJual = TextEditingController();
  TextEditingController pembeli = TextEditingController();
  TextEditingController kebutuhanAlat = TextEditingController();
  TextEditingController biayaSewa = TextEditingController();
  TextEditingController jmlhTngaKrja = TextEditingController();
  TextEditingController biayaTngaKrja = TextEditingController();

  List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  String satuanHasilPanen;
  String satuanJmlhTngaKrja;

  bool checked = false;

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
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Detail Panen",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/petani.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(-20, 0),
                      ),
                    ],
                  ),
                  height: 210,
                  width: Get.width,
                ),
                const SizedBox(
                  height: 35,
                ),
                _listDetail("Nama Alsintan", "Traktor"),
                _box(),
                _listDetail("Merk", "Quick"),
                _box(),
                _listDetail("Kategori", "Traktor"),
                _box(),
                _listDetail("Harga Sewa", "10.000"),
                _box(),
                _listDetail("Satuan", "per Jam"),
                _box(),
                _listDetail("Keterangan", "Traktor 4 roda"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _box() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget _listDetail(String input, String isi) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              input,
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          const Text(
            ":    ",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          Expanded(
            flex: 6,
            child: Text(
              isi,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pembeli(String input, String isi) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              input,
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          Text(
            ":    ",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          Expanded(
            flex: 6,
            child: Text(
              isi,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonJual() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(
            flex: 4,
            child: Text(
              "",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          const Text(
            "    ",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: 110,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  dialogPanen(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: Text(
                          "Jual Sekarang",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> dialogPanen(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            height: Get.height * 0.75,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          "Masukkan Hasil Panen",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    _box(),
                    _tff("Harga jual satuan", "Harga jual satuan", hrgaJual),
                    _box(),
                    _tff("Pembeli (jika ada)", "Pembeli (jika ada)", pembeli),
                    _box(),
                    _tff("Kebutuhan alat", "Kebutuhan alat", kebutuhanAlat),
                    _box(),
                    _tff("Biaya sewa alat", "Biaya sewa alat", biayaSewa),
                    _box(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: _tff("Jumlah tenaga kerja",
                              "Jumlah tenaga kerja", jmlhTngaKrja),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 4,
                          child: _dropDown(
                              "Satuan", satuanHasilPanen, _dropdownValues),
                        ),
                      ],
                    ),
                    _box(),
                    _tff("Biaya tenaga kerja satuan",
                        "Biaya tenaga kerja satuan", biayaTngaKrja),
                    _box(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: checked,
                          onChanged: (value) {
                            setState(() {
                              checked = value;
                            });
                          },
                        ),
                        const Text(
                          "Data panen yang diisikan sudah benar",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 50,
                              child: TextButton(
                                child: const Text("Batal"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.all(15)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: const BorderSide(
                                          color: Colors.white, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 100,
                              child: TextButton(
                                child: Text("Simpan"),
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.all(15)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: const BorderSide(
                                          color: Colors.green, width: 2),
                                    ),
                                  ),
                                ),
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
          ),
        );
      },
    );
  }

  Widget _tff(String hint, String label, TextEditingController controller) {
    return IntrinsicWidth(
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black54),
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: const EdgeInsets.only(left: 20),
          labelStyle: const TextStyle(color: Colors.white54),
          hintStyle: const TextStyle(color: Colors.white54),
          hintText: hint,
          labelText: label,
        ),
        onSaved: (value) {
          controller.text = value;
        },
      ),
    );
  }

  Widget _dropDown(String hint, String onChange, List<String> list) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Colors.white54),
        ),
        child: DropdownButtonFormField(
          hint: Text(
            hint,
            style: const TextStyle(color: Colors.white54),
          ),
          style: const TextStyle(color: Colors.black54),
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
          isExpanded: false,
          value: onChange,
        ),
      ),
    );
  }
}
