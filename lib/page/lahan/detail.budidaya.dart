import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  // ignore: unused_field
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
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
              _listDetail("Petani", "Raffi Fahru"),
              _box(7),
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
            ],
          ),
        ),
      ),
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
