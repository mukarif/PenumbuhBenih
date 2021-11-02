import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petani/page/pemeliharaan/detail_pemeliharaan.dart';
import 'package:petani/presenter/perawatan_presenter.dart';

class Pemeliharaan extends StatefulWidget {
  const Pemeliharaan({Key key}) : super(key: key);

  @override
  _PemeliharaanState createState() => _PemeliharaanState();
}

class _PemeliharaanState extends State<Pemeliharaan>
    implements GetPerawatanContract {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();

  List _data = [];
  GetPerawatanPresenter _presenter;
  _PemeliharaanState() {
    _presenter = GetPerawatanPresenter(this);
  }

  @override
  void onGetPerawatanError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onGetPerawatanSuccess(dynamic user) {
    print("username Sukses :: " + user.toString());
    _data = user;
  }

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  dateFormat(String date) {
    DateTime now = DateTime.parse(date);
    String formattedDate = DateFormat("d MMMM yyyy").format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    _presenter.doGetPerawatan();
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
                          "Perawatan",
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
                                "Perawatan",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
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
                                  height: 90,
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
                                              Get.to(() =>
                                                  const DetailPemeliharaanPemeliharaan());
                                            },
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  dateFormat(_data[i][
                                                          'jadwal_perawatan']) ??
                                                      "",
                                                  style: const TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  _data[i]['nama'] ?? "",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                const Text(
                                                  "Padi - Sawah Serpong Satu",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                const Text(
                                                  "Luas : 1,2 Hektar",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Padi - Sawah Serpong Satu",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  "Luas : 1,2 hektar",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 13),
                                                ),
                                                Text(
                                                  "Perkiraan panen :12 Oktober 2021",
                                                  style: TextStyle(
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
}
