import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/page/alsintan/detail_alsintan.dart';
import 'package:petani/page/alsintan/tambah_alsintan.dart';

class AlsintanPage extends StatefulWidget {
  const AlsintanPage({Key key}) : super(key: key);

  @override
  _AlsintanState createState() => _AlsintanState();
}

class _AlsintanState extends State<AlsintanPage> {
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
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          height: 85,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 15, bottom: 7, right: 5),
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(() => const DetailAlsintan());
                                    },
                                    title: const Text(
                                      "Traktor",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(top: 4),
                                          child: null,
                                        ),
                                        Text(
                                          "Traktor 4 roda",
                                          style: TextStyle(
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
