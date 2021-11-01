import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/page/alsintan/detail_alsintan.dart';
import 'package:petani/page/alsintan/tambah_alsintan.dart';
import 'package:petani/presenter/alsintan_presenter.dart';

class AlsintanPage extends StatefulWidget {
  const AlsintanPage({Key key}) : super(key: key);

  @override
  _AlsintanState createState() => _AlsintanState();
}

class _AlsintanState extends State<AlsintanPage>
    implements GetAlsintanContract {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();
  List _data = [];

  GetAlsintanPresenter _presenter;
  _AlsintanState() {
    _presenter = GetAlsintanPresenter(this);
  }

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  void onPostLoginError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onPostLoginSuccess(dynamic user) {
    print("username Sukses :: " + user[0].toString());
    _data = user;
  }

  @override
  Widget build(BuildContext context) {
    _presenter.doGetAlsintan();
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
        body: Container(
          color: Colors.white,
          height: Get.height * 0.9,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Daftar Alsintan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                _box(20),
                FutureBuilder<String>(
                    future:
                        _calculation, // a previously-obtained Future<String> or null
                    // ignore: missing_return
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _data.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Container(
                                  height: 85,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5,
                                              top: 15,
                                              bottom: 7,
                                              right: 5),
                                          child: ListTile(
                                            onTap: () {
                                              Get.to(() => DetailAlsintan(
                                                  _data[i]['id']));
                                            },
                                            title: Text(
                                              _data[i]['nama'] ?? "",
                                              style: const TextStyle(
                                                  color: Colors.black,
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
                                                Text(
                                                  _data[i]['keterangan'] ?? "",
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 15),
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
                                            child: Image.network(
                                              _data[i]['foto'] ??
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
                                                offset: const Offset(-20, 0),
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
                        );
                      } else if (snapshot.hasError) {
                        return const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        );
                      } else {
                        return const SizedBox(
                          child: CircularProgressIndicator(),
                          width: 60,
                          height: 60,
                        );
                      }
                      // return Center(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: children,
                      //   ),
                      // );
                    }),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    width: 200,
                    child: TextButton(
                      child: const Text(
                        "+ Tambah Alsintan Baru",
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side:
                                const BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => const TambahAlsintanBaru());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _box(double height) {
    return SizedBox(
      height: height,
    );
  }
}
