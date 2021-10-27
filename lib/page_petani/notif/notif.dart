import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifikasiPetani extends StatefulWidget {
  const NotifikasiPetani({Key key}) : super(key: key);

  @override
  _NotifikasiPetaniState createState() => _NotifikasiPetaniState();
}

class _NotifikasiPetaniState extends State<NotifikasiPetani> {
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Informasi Cuaca",
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
                        "Prakiraan Cuaca di lokasi saat ini",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                        child: Container(
                          height: 70,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              "Senin, 21 Oktober 2021",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 13),
                            ),
                            subtitle: Text(
                              "Hujan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Column(
                              children: const [
                                Icon(Icons.grain),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "22 C",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
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
}
