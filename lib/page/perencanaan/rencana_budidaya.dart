import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/page/lahan/detail_budidaya.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/presenter/budidaya_presenter.dart';
import 'package:petani/helper/date_format.dart';

class RencanaBudidaya extends StatefulWidget {
  const RencanaBudidaya({Key key}) : super(key: key);

  @override
  _RencanaBudidayaState createState() => _RencanaBudidayaState();
}

class _RencanaBudidayaState extends State<RencanaBudidaya>
    implements GetBudidayaContract {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();

  List _data = [];
  GetBudidayaPresenter _presenter;
  _RencanaBudidayaState() {
    _presenter = GetBudidayaPresenter(this);
  }

  @override
  void onGetBudidayaError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onGetBudidayaSuccess(dynamic user) {
    print("username Sukses :: " + user.toString());
    _data = user;
  }

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    _presenter.doGetBudidaya();
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
          child: FutureBuilder(
              future:
                  _calculation, // a previously-obtained Future<String> or null
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Rencana Budidaya",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Tanaman dalam masa tanam",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _data.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                                child: Container(
                                  height: 100,
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
                                              Get.to(() => DetailBudidaya(
                                                  _data[i]['id']));
                                            },
                                            title: Text(
                                              _data[i]['komoditas']
                                                      ['jenis_komoditas'] ??
                                                  "",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _data[i]['lahan_anggota_poktan']
                                                          ['nama'] ??
                                                      "Sawah Serpong Satu",
                                                  style: const TextStyle(
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  _data[i]['luas_lahan'] != null
                                                      ? "Luas : " +
                                                          _data[i]['luas_lahan']
                                                      : "Luas : ",
                                                  style: const TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 13),
                                                ),
                                                Text(
                                                  _data[i]['perkiraan_tgl_panen'] !=
                                                          null
                                                      ? "Perkiraan panen : " +
                                                          dateFormat(_data[i][
                                                              'perkiraan_tgl_panen'])
                                                      : "Perkiraan panen :",
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
                                                offset: const Offset(-20, 0),
                                              ),
                                            ],
                                          ),
                                          height: 100,
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
              }),
        ));
  }
}
