// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petani/page/lahan/daftar_lahan.dart';
import 'package:petani/extra/logout_alert.dart';
import 'package:petani/page/perencanaan/rencana_budidaya.dart';
import 'package:petani/page/info_harga/info_harga.dart';
import 'package:petani/page/ringkasan/ringkasan.dart';
import 'package:petani/page/anggota/manajemen_anggota.dart';
import 'package:petani/page/pemeliharaan/pemeliharaan.dart';
import 'package:petani/page/hasil_panen/hasil_panen.dart';
import 'package:petani/page/alsintan/alsintan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String waktu = "";

  @override
  void initState() {
    super.initState();
    now();
  }

  void now() {
    var timeNow = DateTime.now();
    // final formatedDate = new DateFormat('yyyy-MM-dd');
    final time = DateFormat("dd-MM-yyyy").format(timeNow);
    waktu = time;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Alerts.showAlertDialog(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(size: size, waktu: waktu),
            const SizedBox(
              height: 20,
            ),
            const Persediaan(),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Layanan Food Estate",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            const RowMenu1(),
            const RowMenu2(),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              child: Text(
                "Seputar Pertanian",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowMenu1 extends StatelessWidget {
  const RowMenu1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: Image.asset(
                  'assets/icons/Rincian.png',
                  height: 80.0,
                  width: 80.0,
                ),
                onTap: () {
                  Get.to(() => const RingkasanPage());
                },
              ),
              const Text(
                "Ringkasan",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: Image.asset(
                  'assets/icons/anggota.png',
                  height: 80.0,
                  width: 80.0,
                ),
                onTap: () {
                  Get.to(() => const ManajemenAnggotaPage());
                },
              ),
              const Text(
                "Manajemen\nAnggota",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: Image.asset(
                  'assets/icons/lahan.png',
                  height: 80.0,
                  width: 80.0,
                ),
                onTap: () {
                  Get.to(() => const DaftarLahan());
                },
              ),
              const Text(
                "Daftar\nLahan",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: Image.asset(
                  'assets/icons/rencana.png',
                  height: 80.0,
                  width: 80.0,
                ),
                onTap: () {
                  Get.to(() => const RencanaBudidaya());
                },
              ),
              const Text(
                "Rencana\nBudidaya",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowMenu2 extends StatelessWidget {
  const RowMenu2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Flexible(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Image.asset(
                    'assets/icons/pemeliharaan.png',
                    height: 80.0,
                    width: 80.0,
                  ),
                  onTap: () {
                    Get.to(() => const Pemeliharaan());
                  },
                ),
                const Text(
                  "Perawatan",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Image.asset(
                    'assets/icons/hasil_panen.png',
                    height: 80.0,
                    width: 80.0,
                  ),
                  onTap: () {
                    Get.to(() => const HasilPanen());
                  },
                ),
                const Text(
                  "Hasil\nPanen",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Image.asset(
                    'assets/icons/tractor2-01.png',
                    height: 80.0,
                    width: 80.0,
                  ),
                  onTap: () {
                    Get.to(() => const AlsintanPage());
                  },
                ),
                const Text(
                  "Alsintan &\nSaprotan",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Image.asset(
                    'assets/icons/info_harga.png',
                    height: 80.0,
                    width: 80.0,
                  ),
                  onTap: () {
                    Get.to(() => const InfoHargaKomoditas());
                  },
                ),
                const Text(
                  "Info\nHarga",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
    @required this.waktu,
  }) : super(key: key);

  final Size size;
  final String waktu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.16,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 20,
              top: 20,
            ),
            height: size.height * 0.2,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat datang,",
                      style: TextStyle(
                        color: Colors.grey[350],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        " Raffi Fahru",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      waktu,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Hujan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "33 C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Persediaan extends StatelessWidget {
  const Persediaan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Seed Poin : 1000 biji",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Total Lahan : 1.2 Hektar",
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
