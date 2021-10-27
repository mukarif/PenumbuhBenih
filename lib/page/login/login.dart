import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:petani/extra/box.dart';
import 'package:petani/extra/bottom_nav.dart';
import 'package:petani/page/login/daftar_baru.dart';
import 'package:petani/page/login/lupa_pass.dart';

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

  String validatePassword(value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length <= 7) {
      return "Password to short, please make 7 character";
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomBox(h: 200),
                    Image.asset(
                      "assets/images/row_putih.png",
                      width: Get.width * 0.7,
                      height: 80,
                    ),
                    const CustomBox(h: 5),
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
                    const CustomBox(h: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: formKey,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                style: const TextStyle(color: Colors.white70),
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: "Email",
                                  labelText: "Email",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: RequiredValidator(
                                    errorText: 'NRP/NIP required'),
                                controller: userTC,
                                onSaved: (value) {
                                  userTC.text = value;
                                },
                              ),
                              const CustomBox(h: 15),
                              TextFormField(
                                style: const TextStyle(color: Colors.white70),
                                decoration: InputDecoration(
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
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
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
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
                              const CustomBox(h: 100),
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
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          side: const BorderSide(
                                              color: Colors.white, width: 2),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.to(() => const TabBarPage());
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Belum punya Akun?",
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => const DaftarBaru());
                                    },
                                    child: const Text(
                                      "Daftar Baru",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
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
}
