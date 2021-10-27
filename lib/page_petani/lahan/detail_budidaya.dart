import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/page_petani/lahan/detail_pemeliharaan.dart';
import 'package:petani/page_petani/perencanaan/rencana_budidaya.dart';

class DetailBudidaya extends StatefulWidget {
  const DetailBudidaya({Key key}) : super(key: key);

  @override
  _DetailBudidayaState createState() => _DetailBudidayaState();
}

class _DetailBudidayaState extends State<DetailBudidaya> {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();
  TextEditingController hslPanen = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(() => const RencanaBudidaya());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: Get.height * 0.9,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Detail Budidaya",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              _box(40),
              _listDetail("Jenis tanaman", "Padi"),
              _box(7),
              _listDetail("Lokasi lahan", "Padi"),
              _box(7),
              _listDetail("Luas lahan", "Padi"),
              _box(7),
              _listDetail("Tanggal tanam", "Padi"),
              _box(7),
              _listDetail("Perkiraan tanggal panen", "Padi"),
              _box(7),
              _listDetail("Perkiraan hasil panen", "Padi"),
              _box(15),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Perawatan",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const DetailPemeliharaan());
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              _box(10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                      child: Container(
                        height: 80,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7, left: 5),
                                child: ListTile(
                                  onTap: null,
                                  title: const Text(
                                    "30_Oktober 2021",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  subtitle: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pemupukan - Urea",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "Perkiraan Panen 12 Oktober 2021",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
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
                                      offset: Offset(-20, 0),
                                    ),
                                  ],
                                ),
                                height: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: 200,
                  child: TextButton(
                    child: const Text(
                      "Panen",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                    ),
                    onPressed: () {
                      dialogPanen(context);
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
              padding: EdgeInsets.all(10),
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
                    _box(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: _tff("Hasil panen", "Hasil panen", hslPanen),
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
                    _box(10),
                    _tff("Harga jual satuan", "Harga jual satuan", hrgaJual),
                    _box(10),
                    _tff("Pembeli (jika ada)", "Pembeli (jika ada)", pembeli),
                    _box(10),
                    _tff("Kebutuhan alat", "Kebutuhan alat", kebutuhanAlat),
                    _box(10),
                    _tff("Biaya sewa alat", "Biaya sewa alat", biayaSewa),
                    _box(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: _tff(
                              "Jumlah pekerja", "Jumlah pekerja", jmlhTngaKrja),
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
                    _box(10),
                    _tff("Biaya tenaga kerja satuan",
                        "Biaya tenaga kerja satuan", biayaTngaKrja),
                    _box(10),
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
                                child: Text("Batal"),
                                onPressed: () {},
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
                          SizedBox(
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

  Widget _listDetail(String input, String isi) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
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
            flex: 5,
            child: Text(
              isi,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _box(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _tff(String hint, String label, TextEditingController controller) {
    return IntrinsicWidth(
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black54),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
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
            style: TextStyle(color: Colors.white54),
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
