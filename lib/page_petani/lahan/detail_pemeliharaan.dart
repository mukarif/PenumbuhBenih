import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/page_petani/lahan/detail_budidaya.dart';

class DetailPemeliharaan extends StatefulWidget {
  const DetailPemeliharaan({Key key}) : super(key: key);

  @override
  _DetailPemeliharaanState createState() => _DetailPemeliharaanState();
}

class _DetailPemeliharaanState extends State<DetailPemeliharaan> {
  GlobalKey<FormState> formDetailPemeliharaan = GlobalKey<FormState>();
  TextEditingController tanggal = TextEditingController();
  TextEditingController waktu = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  TextEditingController hargaPupuk = TextEditingController();
  TextEditingController kebutuhanAlat = TextEditingController();
  TextEditingController biayaSewa = TextEditingController();
  TextEditingController jmlhTngaKerja = TextEditingController();
  TextEditingController biayaTngaKrja = TextEditingController();

  List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  String kegiatan;
  String jenisPupuk;
  String satuanJumlah;
  String satuanJmlhTngaKrja;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(() => DetailBudidaya());
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
                  "Detail Perawatan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formDetailPemeliharaan,
                  child: Column(
                    children: [
                      _formField("Kegiatan", kegiatan, _dropdownValues),
                      _box(),
                      _tff("Tanggal", "Tanggal", tanggal),
                      _box(),
                      _tff("Waktu", "Waktu", waktu),
                      _box(),
                      _formField(
                          "Jenis pupuk/obat", jenisPupuk, _dropdownValues),
                      _box(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _tff("Jumlah", "Jumlah", jumlah),
                          ),
                          _box(),
                          Expanded(
                            child: _formField(
                                "Satuan", satuanJumlah, _dropdownValues),
                          ),
                        ],
                      ),
                      _box(),
                      _tff("Harga pupuk/obat satuan", "Harga pupuk/obat satuan",
                          hargaPupuk),
                      _box(),
                      _tff("Kebutuhan alat", "Kebutuhan alat", kebutuhanAlat),
                      _box(),
                      _tff("Biaya sewa alat", "Biaya sewa alat", biayaSewa),
                      _box(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _tff("Jumlah tenaga kerja",
                                "Jumlah tenaga kerja", jmlhTngaKerja),
                          ),
                          _box(),
                          Expanded(
                            child: _formField(
                                "Satuan", satuanJmlhTngaKrja, _dropdownValues),
                          ),
                        ],
                      ),
                      _box(),
                      _tff("Biaya tenaga kerja satuan", "Biaya tenaga kerja",
                          biayaTngaKrja),
                      _box(),
                      Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _subtotal(MainAxisAlignment.end, "Subtotal"),
                          _box(),
                          _listTotal(MainAxisAlignment.spaceBetween,
                              "Pupuk/Obat", "100.000"),
                          const SizedBox(
                            height: 8,
                          ),
                          _listTotal(
                              MainAxisAlignment.spaceBetween, "Alat", "25.000"),
                          const SizedBox(
                            height: 8,
                          ),
                          _listTotal(MainAxisAlignment.spaceBetween,
                              "Tenaga Kerja", "75.000"),
                          Divider(
                            indent: 270,
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                          _total(MainAxisAlignment.spaceBetween, "Total",
                              "200.000"),
                        ],
                      ),
                      _box(),
                      _box(),
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

  Widget _subtotal(MainAxisAlignment text, String isi) {
    return Row(
      mainAxisAlignment: text,
      children: [
        Text(
          isi,
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _listTotal(MainAxisAlignment text, String isi1, String isi2) {
    return Row(
      mainAxisAlignment: text,
      children: [
        Text(
          isi1,
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          isi2,
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _total(MainAxisAlignment text, String isi1, String isi2) {
    return Row(
      mainAxisAlignment: text,
      children: [
        Text(
          isi1,
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          isi2,
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
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
            print("Presses simpan detail pemeliharaan");
          },
        ),
      ),
    );
  }
}
