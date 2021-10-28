import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/model/user.dart';
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
  String _nama;
  String _alamat;
  String _gapoktan;
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
    print("username Sukses :: " + user['username'].toString());

    _nama = user['detail']['role']['poktan']['nama'];
    _alamat = user['detail']['role']['poktan']['alamat'];
    _gapoktan = user['detail']['role']['poktan']['gapoktan'];
    print('Nama : $_nama');
  }

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

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
        child: FutureBuilder<String>(
          future: _calculation, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Column(
                  children: [
                    headerAkun(),
                    bodyIcon(),
                    bodyProfile(_nama, _gapoktan),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _tff(_nama, _nama, nama),
                            _box(10),
                            _tff(_alamat, _alamat, alamat),
                            _box(10),
                            _tff(_gapoktan, _gapoktan, poktan),
                            _box(10),
                            _password("Pengaturan Password"),
                          ],
                        ),
                      ),
                    ),
                    logOut()
                  ],
                ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
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

  Container bodyProfile(String nama, String gapoktan) {
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
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  gapoktan,
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
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
