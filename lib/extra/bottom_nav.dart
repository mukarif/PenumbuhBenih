import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petani/page/akun/akun.dart';
import 'package:petani/page/lahan/daftar_lahan.dart';
import 'package:petani/page/home/home.dart';
import 'package:petani/page/lapor_gangguan/lapor_gangguan.dart';
import 'package:petani/page/notif/notif.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _currentIndex = 0;
  DateTime currentBackPressTime;
  List<Widget> tabs = <Widget>[
    const HomePage(),
    const DaftarLahan(),
    const NotifikasiPetani(),
    const LaporanGanggguan(),
    const AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () => handleWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: tabs.elementAt(_currentIndex),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
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

  Widget _buildBottomBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      // color: Colors.green,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                activeColor: Colors.white,
                color: Colors.white,
                rippleColor: Colors.white,
                hoverColor: Colors.transparent,
                gap: 5,
                duration: const Duration(milliseconds: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                tabBackgroundColor: Colors.transparent,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: "Home",
                  ),
                  GButton(
                    icon: Icons.auto_awesome_motion_sharp,
                    text: 'Lahan',
                  ),
                  GButton(
                    icon: Icons.chat,
                    text: 'Pesan',
                  ),
                  GButton(
                    icon: Icons.notifications_none,
                    text: "Notif",
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Akun',
                  ),
                ],
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
