import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/page/anggota/detail_anggota.dart';
import 'package:petani/page/anggota/permohonan.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/presenter/anggota_presenter.dart';

class ManajemenAnggotaPage extends StatefulWidget {
  const ManajemenAnggotaPage({Key key}) : super(key: key);

  @override
  _ManajemenAnggotaState createState() => _ManajemenAnggotaState();
}

class _ManajemenAnggotaState extends State<ManajemenAnggotaPage>
    implements GetAnggotaContract {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();

  GetAnggotaPresenter _presenter;
  List _anggota = [];

  _ManajemenAnggotaState() {
    _presenter = GetAnggotaPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.doGetAnggota();
  }

  @override
  void onPostLoginError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onPostLoginSuccess(List anggota) {
    print("Sukses :: " + anggota[0].toString());
    _anggota = anggota;
  }

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
        body: FutureBuilder(
            future: _calculation,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  color: Colors.white,
                  height: Get.height * 0.9,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Manajemen Anggota",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _box(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const InkWell(
                                child: Text(
                                  "Anggota Kelompok Tani",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: null,
                              ),
                              InkWell(
                                child: const Text(
                                  "Permohonan",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Get.to(() => const PermohonanPage());
                                },
                              ),
                            ],
                          ),
                        ),
                        _box(10),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _anggota.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Container(
                                  height: 85,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5,
                                              top: 5,
                                              bottom: 7,
                                              right: 5),
                                          child: ListTile(
                                            onTap: () {
                                              Get.to(() => DetailAnggota(
                                                  _anggota[i]['id']));
                                            },
                                            title: Text(
                                              _anggota[i]['nama'] ?? "",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 4),
                                                  child: null,
                                                ),
                                                const Text(
                                                  "Petani",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  _anggota[i]['luas_lahan'] !=
                                                          null
                                                      ? "Luas : " +
                                                          _anggota[i]
                                                                  ['luas_lahan']
                                                              .toString()
                                                      : "",
                                                  style: const TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 13),
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
                                          height: 85,
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
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return Center(
                child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(top: 20.0),
                    //height: 440.0,
                    child: const SizedBox(
                      child: CircularProgressIndicator(),
                      height: 35.0,
                      width: 35.0,
                    )),
              );
            }));
  }

  Widget _box(double height) {
    return SizedBox(
      height: height,
    );
  }
}
