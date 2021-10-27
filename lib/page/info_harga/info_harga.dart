import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/page/info_harga/info_harga_alsintan.dart';

class InfoHargaKomoditas extends StatefulWidget {
  const InfoHargaKomoditas({Key key}) : super(key: key);

  @override
  _InfoHargaKomoditasState createState() => _InfoHargaKomoditasState();
}

class _InfoHargaKomoditasState extends State<InfoHargaKomoditas> {
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
                  "Informasi Harga Terbaru",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                _box(10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  width: Get.width * 0.4,
                  height: 30,
                  child: const Center(
                    child: Text(
                      "per 10 Oktober 2021",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _box(20),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const InkWell(
                        child: Text(
                          "Komoditas",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: null,
                      ),
                      InkWell(
                        child: const Text(
                          "Alsintan & Saprotan",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Get.to(() => const InfoHargaAlsintan());
                        },
                      ),
                    ],
                  ),
                ),
                _box(5),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
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
                                child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: InkWell(
                                      onTap: () {
                                        // Get.to(()=> const);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Beras",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15),
                                          ),
                                          _box(10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Rp 10.000,- per kg",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: const [
                                                  Icon(
                                                    Icons.arrow_upward,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    "Rp 200,-",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                    // ListTile(
                                    //   onTap: () {
                                    //     Get.to(() => DetailBudidaya());
                                    //   },
                                    //   title: const Text(
                                    //     "Beras",
                                    //     style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 18),
                                    //   ),
                                    //   subtitle: Text(
                                    //     "Rp 10.000,- per kg",
                                    //     style: TextStyle(
                                    //         color: Colors.white70, fontSize: 15),
                                    //   ),
                                    //   trailing: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.end,
                                    //     children: const [
                                    //       Icon(
                                    //         Icons.arrow_upward,
                                    //         color: Colors.red,
                                    //       ),
                                    //       Text("Rp 200,-"),
                                    //     ],
                                    //   ),
                                    // ),
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
