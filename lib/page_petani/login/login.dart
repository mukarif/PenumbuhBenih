// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/extra/bottom_nav_petani.dart';
import 'package:petani/helper/Token.dart';
import 'package:petani/page_petani/home/home.dart';
import 'package:petani/page_petani/lahan/lahan.dart';
import 'package:petani/page_petani/login/daftar_baru.dart';
import 'package:petani/page_petani/login/lupa_pass.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _obsecureText = true;

  TextEditingController userTC = TextEditingController();
  TextEditingController passTC = TextEditingController();

  bool loading = true;

  // void cekLogin() async {
  //   try {
  //     // get token from local storage
  //     var token = await Token().getAccessToken();
  //     if (token != null) {
  //       Get.offAll(() => CurveBar());
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return "Password tidak boleh kosong";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_hijau.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/row_putih.png",
                      width: Get.width * 0.7,
                      height: 80,
                      // fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Selamat Datang!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      autovalidate: true,
                      key: formKey,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white),
                                hintText: "Email",
                                labelText: "Email",
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                              validator: RequiredValidator(
                                  errorText: 'Email Dibutuhkan'),
                              controller: userTC,
                              onSaved: (value) {
                                userTC.text = value;
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              style: const TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white),
                                labelText: "Password",
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obsecureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obsecureText = !_obsecureText;
                                    });
                                  },
                                ),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(0)),
                              ),
                              obscureText: _obsecureText,
                              validator: validatePassword,
                              controller: passTC,
                              onSaved: (value) {
                                passTC.text = value;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.offAll(() => const LupaPass());
                                  },
                                  child: const Text(
                                    "Lupa Password?",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: 320,
                                child: TextButton(
                                  child: const Text(
                                    "Masuk",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white70),
                                  ),
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.all(15)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: const BorderSide(
                                            color: Colors.white, width: 2),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      loading
                                          ? CircularProgressIndicator()
                                          : _testLogin();
                                      // _testLogin();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Belum punya Akun?",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const DaftarBaru());
                                  },
                                  child: const Text(
                                    "Daftar Baru",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _testLogin() async {
    if (formKey.currentState.validate()) {
      // formKey.currentState.save();
      setState(() {
        loading = true;
      });
      print("status saat ini: $loading");
      print("Validate sukses");

      if (userTC.text == "petani") {
        Get.to(() => const TabBarPagePetani());
      } else {
        Get.to(() => const TabBarPage());
      }

      // var url = "http://34.101.65.93/v1/auth-token/";
      // var _body = {'username': userTC.text, 'password': passTC.text};
      // // print("body sebelum eksekusi :  " + json.encode(_body));

      // // print("url :  " + json.encode(url));
      // try {
      //   var response = await http.post(
      //     Uri.parse(url),
      //     body: json.encode(_body),
      //     headers: {
      //       // "Accept": "application/json",
      //       "Content-Type": "application/json",
      //       // "Authorization": "Bearer " + await Token().getAccessToken(),
      //     },
      //   );
      //   var res = json.decode(response.body);
      //   // print("ini response body : $res");
      //   if (response.statusCode == 200) {
      //     Token().saveToken(res['api_key']);
      //     // print('Token : ' + res['api_key']);
      //     // token sukses

      //     var getRole = res['profile']['role'];
      //     var role = getRole['id'];
      //     // print(role);
      //     // role sukses

      //     if (role == 1) {
      //       setState(() {
      //         loading = false;
      //       });
      //       Get.to(() => const TabBarPage());
      //     } else {
      //       setState(() {
      //         loading = false;
      //       });
      //       Get.offAll(() => const DaftarLahan());
      //     }
      //   } else {
      //     _showAlertDialog(context, "Error",
      //         "Login Gagal....\nTerjadi masalah sewaktu login.");
      //   }
      // } catch (e) {
      //   print(e);
      // }
    } else {
      print("validate unsuccess");
    }
  }
}

_showAlertDialog(BuildContext context, String title, String content) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () => Navigator.pop(context),
  );
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
