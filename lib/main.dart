import 'package:flutter/material.dart';
import 'package:libro_locate/pages/libraryinfoscreen.dart';
import 'pages/home_page.dart';
import 'package:libro_locate/models/libraryinfo.dart';
import 'pages/qr_page.dart';
import 'pages/profile_page.dart';
import 'package:gsheets/gsheets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:libro_locate/pages/indlibrarydetails_page.dart';
import 'package:libro_locate/pages/reservepage.dart';


// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home_page",
      routes: {
        "/home_page": (context) => MyHomePage(),
        "/notifications_page": (context) => ProfilePage(),
        "/libraryinfoscreen": (context) => LibraryInfoScreen(),

        "/profile_page": (context) => ProfilePage(),
        "/qr_page": (context) => QRPage(),
        "/indlibrarydetails_page": (context) => LibraryDetailPage(),
        "/reservepage.dart": (context) => ReservePage(),
      },
    );
  }
}



