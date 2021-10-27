import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petani/page_petani/akun/akun.dart';
import 'package:petani/page_petani/home/home.dart';
import 'package:petani/page_petani/lapor_gangguan/lapor_gangguan.dart';
import 'package:petani/page_petani/notif/notif.dart';

class TabBarPagePetani extends StatefulWidget {
  const TabBarPagePetani({Key key}) : super(key: key);

  @override
  _TabBarPagePetaniState createState() => _TabBarPagePetaniState();
}

class _TabBarPagePetaniState extends State<TabBarPagePetani> {
  int _currentIndex = 0;
  List<Widget> tabs = <Widget>[
    const HomePage(),
    // const DaftarLahan(),
    const NotifikasiPetani(),
    const LaporanGanggguan(),
    const AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs.elementAt(_currentIndex),
      bottomNavigationBar: _buildBottomBar(),
    );
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            activeColor: Colors.white,
            color: Colors.white,
            rippleColor: Colors.white,
            hoverColor: Colors.transparent,
            gap: 8,
            duration: const Duration(milliseconds: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tabBackgroundColor: Colors.transparent,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.chat,
                text: 'Pesan',
              ),
              GButton(
                icon: Icons.notifications_none,
                text: "Notifikasi",
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
        ),
      ),
    );
  }
}
