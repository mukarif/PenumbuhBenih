import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:petani/page/anggota/manajemen_anggota.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/presenter/permohonan_presenter.dart';
import 'package:petani/presenter/update_permohonan.dart';

class PermohonanPage extends StatefulWidget {
  const PermohonanPage({Key key}) : super(key: key);

  @override
  _PermohonanState createState() => _PermohonanState();
}

class _PermohonanState extends State<PermohonanPage>
    implements GetPermohonanContract, PutPermohonanContract {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();
  // ignore: deprecated_member_use
  List _permohonan = [];
  GetPermohonanPresenter _presenter;
  PutPermohonanPresenter _presenterPut;
  _PermohonanState() {
    _presenter = GetPermohonanPresenter(this);
    _presenterPut = PutPermohonanPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.doGetPermohonan();
  }

  @override
  void onPutError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onPutSuccess(pm) {
    print("Sukses :: " + pm.toString());
    if (pm != null) {
      return _successPages();
    }
  }

  @override
  void onPostLoginError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onPostLoginSuccess(List pm) {
    print("Sukses :: " + pm[0].toString());
    _permohonan = pm;
  }

  void _successPages() {
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const ManajemenAnggotaPage()));
    });
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
                      "Permohonan Anggota",
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
                          InkWell(
                            child: const Text(
                              "Anggota Kelompok Tani",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Get.to(() => const ManajemenAnggotaPage());
                            },
                          ),
                          const InkWell(
                            child: Text(
                              "Permohonan",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: null,
                          ),
                        ],
                      ),
                    ),
                    _box(10),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _permohonan.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Container(
                              height: 110,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5, bottom: 7, right: 5),
                                      child: ListTile(
                                        onTap: () {
                                          // Get.to(() => const DetailBudidaya());
                                        },
                                        title: Text(
                                          _permohonan[i]['nama'],
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
                                              padding: EdgeInsets.only(top: 4),
                                              child: null,
                                            ),
                                            const Text(
                                              "Petani",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 15),
                                            ),
                                            const Text(
                                              "Luas : 1,2 hektar",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 13),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 13),
                                              child: InkWell(
                                                child: const Text(
                                                  "+ Tambahkan sebagai anggota",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: 13),
                                                ),
                                                onTap: () {
                                                  _presenterPut.doPutPermohonan(
                                                      _permohonan[i]['id']);
                                                },
                                              ),
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
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 10,
                                            offset: Offset(-20, 0),
                                          ),
                                        ],
                                      ),
                                      height: 110,
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
            // ListView.builder(
            //     itemCount: data.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //         height: 75,
            //         color: Colors.white,
            //         child: Center(
            //           child: Text(data[index].title),
            //         ),
            //       );
            //     });
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
        },
      ),
    );
  }

  Widget _box(double height) {
    return SizedBox(
      height: height,
    );
  }
}
