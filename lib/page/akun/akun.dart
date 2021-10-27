import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/page/akun/pengaturan_akun.dart';
import 'package:petani/page/akun/ubah_pass.dart';
import 'package:petani/extra/logout_alert.dart';
import 'package:petani/presenter/user_presenter.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({Key key}) : super(key: key);

  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> implements GetUserContract {
  GlobalKey<FormState> formAkun = GlobalKey<FormState>();

  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController poktan = TextEditingController();

  GetUserPresenter _presenter;
  _AkunPageState() {
    _presenter = GetUserPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    _presenter.doGetUser();
  }

  @override
  void onPostLoginError(String errorTxt) {
    print("Error :: " + errorTxt);
  }

  @override
  void onPostLoginSuccess(dynamic user) {
    print("User Sukses :: " + user.toString());
    // if (token['profile']['role']['id'] == 1) {
    //   Get.to(() => const TabBarPagePetani());
    // } else {
    //   Get.to(() => const TabBarPage());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.off(() => const TabBarPage());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerAkun(),
            bodyIcon(),
            bodyProfile(),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _tff("Sumber Makmur", "Sumber Makmur", nama),
                    _box(10),
                    _tff("Serpong, Tangerang", "Serpong, Tangerang", alamat),
                    _box(10),
                    _tff("Gapoktan", "Gapoktan", poktan),
                    _box(10),
                    _password("Pengaturan Password"),
                  ],
                ),
              ),
            ),
            logOut()
          ],
        ),
      ),
    );
  }

  Center logOut() {
    return Center(
      child: SizedBox(
        width: 150,
        child: TextButton(
          child: const Text(
            "logout",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Alerts.showAlertDialog(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red[900]),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container bodyProfile() {
    return Container(
      color: Colors.green,
      height: 90,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Raffi Fahru",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Kelompok Tani",
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
            InkWell(
              child: const Icon(
                Icons.mode_edit,
                color: Colors.white,
              ),
              onTap: () {
                Get.to(() => const PengaturanAkun());
              },
            )
          ],
        ),
      ),
    );
  }

  Container bodyIcon() {
    return Container(
      color: Colors.blueGrey[200],
      height: 130,
      width: Get.width,
      child: const Center(
        child: Icon(
          Icons.person,
          color: Colors.black87,
          size: 100,
        ),
      ),
    );
  }

  Padding headerAkun() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Center(
        child: Text(
          "Akun",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget _tff(String hint, String label, TextEditingController controller) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        labelStyle: const TextStyle(color: Colors.black54),
        hintStyle: const TextStyle(color: Colors.black87),
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onSaved: (value) {
        controller.text = value;
      },
    );
  }

  Widget _password(String hint) {
    return TextFormField(
      readOnly: true,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        labelStyle: const TextStyle(color: Colors.black54),
        hintStyle: const TextStyle(color: Colors.black87),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onTap: () {
        Get.to(() => const UbahPass());
      },
    );
  }

  Widget _box(double tinggi) {
    return SizedBox(
      height: tinggi,
    );
  }
}
