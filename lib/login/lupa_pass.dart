import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/login/login.dart';

class LupaPass extends StatefulWidget {
  const LupaPass({Key key}) : super(key: key);

  @override
  _LupaPassState createState() => _LupaPassState();
}

class _LupaPassState extends State<LupaPass> {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime currentBackPressTime;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> handleWillPop(BuildContext context) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text("double click for close app"),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () => handleWillPop(context),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: Get.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg_hijau.png"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _box(100),
              Image.asset(
                "assets/images/col_putih.png",
                width: Get.width * 0.35,
                height: Get.height * 0.2,
                // fit: BoxFit.fill,
              ),
              _box(10),
              const Text(
                "Lupa Password",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              _box(5),
              const Text(
                "Lengkapi Alamat Email Anda",
                style: TextStyle(color: Colors.white54),
              ),
              _box(25),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: email,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      labelStyle: const TextStyle(color: Colors.white),
                      hintStyle: const TextStyle(color: Colors.white),
                      hintText: "Email",
                      labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onSaved: (value) {
                      email.text = value;
                    },
                  ),
                ),
              ),
              _box(30),
              SizedBox(
                width: 200,
                child: TextButton(
                  child: Text(
                    "Atur ulang password",
                    style: TextStyle(fontSize: 14, color: Colors.green[400]),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(15)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.offAll(() => const LoginPage());
                  },
                ),
              ),
            ],
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
