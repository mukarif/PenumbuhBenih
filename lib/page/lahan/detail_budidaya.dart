import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/helper/date_format.dart';
import 'package:petani/presenter/detail_budidaya_presenter.dart';

class DetailBudidaya extends StatefulWidget {
  int id;
  DetailBudidaya(this.id);

  @override
  // ignore: no_logic_in_create_state
  _DetailBudidayaState createState() => _DetailBudidayaState(id);
}

class _DetailBudidayaState extends State<DetailBudidaya>
    implements GetDetailBudidayaContract {
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
  int _id;

  bool checked = false;

  dynamic _data;
  String namaPeatani;
  String jenisTanaman;
  String luasLahan;
  String geoJson;
  String tglTanam;
  String perkiraanPanen;
  String perkiraanHasil;

  List _perawatan = [];

  GetDetailBudidayaPresenter _presenter;
  _DetailBudidayaState(this._id) {
    _presenter = GetDetailBudidayaPresenter(this);
  }

  @override
  void onDetailBudidayaError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onDetailBudidayaSuccess(dynamic user) {
    print("username Sukses :: " + user['nama_petani']);
    namaPeatani = user['nama_petani'];
    jenisTanaman = user['jenis_tanaman'];
    luasLahan = user['luas_lahan'];
    geoJson = user['geo_json'];
    tglTanam = user['tgl_tanam'];
    perkiraanPanen = user['perkiraan_tgl_panen'];
    perkiraanHasil = user['perkiraan_hasil_panen'];
    _perawatan = user['perawatan'];
    _data = user;
  }

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    _presenter.doGetDetailBudidaya(_id);
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
          child: FutureBuilder(
              future:
                  _calculation, // a previously-obtained Future<String> or null
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                double kg = double.parse(perkiraanHasil);
                String panen = kg.toInt().toString();
                double ht = double.parse(luasLahan);
                String luas = ht.toInt().toString();
                List perawatan = _data['perawatan'];
                print("perawatan :: " + _data['perawatan'].toString());
                if (snapshot.hasData) {
                  return Padding(
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
                        _listDetail("Petani", namaPeatani ?? ""),
                        _box(7),
                        _listDetail("Jenis tanaman", jenisTanaman ?? ""),
                        _box(7),
                        _listDetail("Lokasi lahan", geoJson ?? ""),
                        _box(7),
                        _listDetail("Luas lahan", luas + " Hektar"),
                        _box(7),
                        _listDetail("Tanggal tanam",
                            dateFormat(_data['tgl_tanam']) ?? ""),
                        _box(7),
                        _listDetail("Perkiraan tanggal panen",
                            dateFormat(_data['perkiraan_tgl_panen']) ?? ""),
                        _box(7),
                        _listDetail(
                            "Perkiraan hasil panen", panen.toString() + " kg"),
                        _box(15),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
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
                            itemCount: _perawatan.length,
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
                                          padding: const EdgeInsets.only(
                                              top: 7, left: 5),
                                          child: ListTile(
                                            onTap: null,
                                            title: Text(
                                              dateFormat(_perawatan[i]
                                                      ['jadwal_perawatan']) ??
                                                  "",
                                              style: const TextStyle(
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
                                                      _perawatan[i]['nama'],
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    _box(3),
                                                    Text(
                                                      "Luas : " + luas,
                                                      style: const TextStyle(
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.asset(
                                              "assets/images/petani.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
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

  Widget _listDetail(String input, String isi) {
    print("tekan :: $input");
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
