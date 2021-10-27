import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:petani/page_petani/lahan/detail_budidaya.dart';
import 'package:petani/page_petani/lahan/lahan.dart';
import 'package:petani/page_petani/lahan/tambah_rencana_budidaya.dart';

class DetailLahan extends StatefulWidget {
  const DetailLahan({Key key}) : super(key: key);

  @override
  _DetailLahanState createState() => _DetailLahanState();
}

class _DetailLahanState extends State<DetailLahan> {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();

  final s = "Map 2";
  // GoogleMapsController controller;
  // StreamSubscription<CameraPosition> subscription;
  // CameraPosition position;

  @override
  void initState() {
    super.initState();

    // controller = GoogleMapsController(
    //   initialCameraPosition: CameraPosition(
    //     target: LatLng(37.42796133580664, -122.085749655962),
    //     zoom: 14.4746,
    //   ),
    //   onTap: (latlng) {
    //     Circle circle;
    //     circle = Circle(
    //       circleId: CircleId(
    //         "ID:" + DateTime.now().millisecondsSinceEpoch.toString(),
    //       ),
    //       center: latlng,
    //       fillColor: Color.fromRGBO(255, 0, 0, 1),
    //       strokeColor: Color.fromRGBO(155, 0, 0, 1),
    //       radius: 5,
    //       onTap: () => controller.removeCircle(circle),
    //       consumeTapEvents: true,
    //     );

    //     controller.addCircle(circle);
    //   },
    // );

    // subscription = controller.onCameraMove$.listen((e) {
    //   setState(() {
    //     position = e;
    //   });
    // });
  }

  @override
  void dispose() {
    // subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(() => const DaftarLahan());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Detail Lahan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                _box(20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
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
                          ),
                          height: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Sawah Serpong Satu",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              "12.50 hektar",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Cuaca saat ini",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              "12.50 hektar",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Hujan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              "33 C",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Row(
                    children: const [
                      Text(
                        "Peta Lokasi Lahan",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      // GoogleMaps(controller: controller);
                      print("Masih error");
                    },
                    child: Container(
                      child: const Center(
                        child: Text(
                          'Google MAPS',
                          textScaleFactor: 2,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey[200], spreadRadius: 3),
                        ],
                      ),
                      height: 180,
                    ),
                  ),
                ),
                _box(15),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tanaman dalam masa tanam",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const TambahRencanaBudidaya());
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
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
                                  padding:
                                      const EdgeInsets.only(top: 7, left: 5),
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(() => const DetailBudidaya());
                                    },
                                    title: const Text(
                                      "Padi",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
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
                                          children: const [
                                            Text(
                                              "Luas : 1,2 hektar",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Perkiraan Panen 12 Oktober 2021",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
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
      ),
    );
  }

  Widget _box(double height) {
    return SizedBox(
      height: height,
    );
  }
}
