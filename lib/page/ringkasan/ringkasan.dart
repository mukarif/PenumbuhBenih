import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/page/pengurus/ubah_pengurus_ketua.dart';
import 'package:petani/presenter/count/count_lahan_presenter.dart';
import 'package:petani/presenter/count/count_poktan_presenter.dart';

class RingkasanPage extends StatefulWidget {
  const RingkasanPage({Key key}) : super(key: key);

  @override
  _RingkasanState createState() => _RingkasanState();
}

class _RingkasanState extends State<RingkasanPage>
    implements GetCountAnggotaContract, GetCountLahanContract {
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

  int _anggotaCount;
  int _lahanCount;

  GetCountAnggotaPresenter _presenter;
  GetCountLahanPresenter _presenterLahan;
  _RingkasanState() {
    _presenter = GetCountAnggotaPresenter(this);
    _presenterLahan = GetCountLahanPresenter(this);
  }

  @override
  void onGetCountAnggotaError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onGetCountAnggotaSuccess(int count) {
    print("username Sukses :: " + count.toString());
    _anggotaCount = count;
  }

  @override
  void onGetCountLahanError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onGetCountLahanSuccess(double count) {
    int a = count.toInt();
    print("username Sukses :: " + a.toInt().toString());
    _lahanCount = a;
  }

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    _presenter.doGetCountAnggota();
    _presenterLahan.doGetCountLahan();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(() => const TabBarPage());
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
          child: FutureBuilder(
              future:
                  _calculation, // a previously-obtained Future<String> or null
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Ringkasan",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        _box(40),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Kepengurusan",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        _box(10),
                        _listDetail("Ketua", "Raff Fahru"),
                        _box(7),
                        _listDetail("Wakil Ketua", "Faris"),
                        _box(7),
                        _listDetail("Sekertaris 1", "Haryanto"),
                        _box(7),
                        _listDetail("Sekertaris 2", "Susetyo"),
                        _box(7),
                        _listDetail("Bendahara 1", "Sutono"),
                        _box(7),
                        _listDetail("Bendahara 2", ""),
                        _box(20),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 80,
                                width: 50,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 2, left: 5),
                                  child: ListTile(
                                    onTap: null,
                                    title: const Text(
                                      "Anggota Petani",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Text(
                                        _anggotaCount.toString() ?? "",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 80,
                                width: 50,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 2, left: 5),
                                  child: ListTile(
                                    onTap: null,
                                    title: const Text(
                                      "Total Lahan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Text(
                                        "${_lahanCount.toString()} Hektar" ??
                                            "",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        _box(5),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 80,
                                width: 50,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 2, left: 5),
                                  child: ListTile(
                                    onTap: null,
                                    title: Text(
                                      "Alsintan & Saprotan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "30",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 80,
                                width: 50,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 2, left: 5),
                                  child: ListTile(
                                    onTap: null,
                                    title: Text(
                                      "Pemeliharaan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "30",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        _box(5),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 80,
                                width: 50,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2, left: 5),
                                    child: ListTile(
                                      onTap: null,
                                      title: Text(
                                        "Hasil Panen",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding: EdgeInsets.only(top: 7),
                                        child: Text(
                                          "30",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 80,
                                width: 50,
                                margin: const EdgeInsets.only(left: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 2, left: 5),
                                  child: ListTile(
                                    onTap: null,
                                    title: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        _box(20),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  );
                } else {
                  return Center(
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3.0)),
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.10),
                        ),
                        padding: const EdgeInsets.only(top: 20.0),
                        //height: 440.0,
                        child: const SizedBox(
                          child: CircularProgressIndicator(),
                          height: 35.0,
                          width: 35.0,
                        )),
                  );
                }
                // return Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: children,
                //   ),
                // );
              })),
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
              padding: const EdgeInsets.all(10),
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
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 100,
                              child: TextButton(
                                child: const Text("Simpan"),
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
            flex: 3,
            child: Text(
              input,
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Get.to(() => const UbahPengurus());
              },
              child: const Icon(
                Icons.mode_edit,
                color: Colors.green,
                size: 15,
              ),
            ),
          ),
          const Text(
            ":    ",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          Expanded(
            flex: 5,
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
