import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/page/anggota/manajemen_anggota.dart';
import 'package:petani/extra/bottom_nav.dart';

class PermohonanPage extends StatefulWidget {
  const PermohonanPage({Key key}) : super(key: key);

  @override
  _PermohonanState createState() => _PermohonanState();
}

class _PermohonanState extends State<PermohonanPage> {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();
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
                    itemCount: 2,
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
                                    title: const Text(
                                      "Susanto",
                                      style: TextStyle(
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
                                          padding:
                                              const EdgeInsets.only(top: 13),
                                          child: InkWell(
                                            child: const Text(
                                              "+ Tambahkan sebagai anggota",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 13),
                                            ),
                                            onTap: () {
                                              Get.to(() =>
                                                  const ManajemenAnggotaPage());
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
                                        color: Colors.black.withOpacity(0.3),
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
        ));
  }

  Widget _box(double height) {
    return SizedBox(
      height: height,
    );
  }
}
