import 'dart:async';

import 'package:flutter/material.dart';
import 'package:libro_locate/pages/libraryinfoscreen.dart';
import 'profile_page.dart';
import 'libraryinfoscreen.dart';
import 'qr_page.dart';
import 'home_page.dart';
import 'map_page.dart';





class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    MapPage(),
    LibraryInfoScreen(),
    QRPage(),
    ProfilePage(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade200,

      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        onTap:  (int newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.pink.shade200,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Libraries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2),
            label: 'Reservation QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
          selectedItemColor: Colors.pink.shade200,
      ),
    );
  }
}
