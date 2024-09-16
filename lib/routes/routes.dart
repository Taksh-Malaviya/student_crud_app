import 'package:exam_app/Add_data.dart';
import 'package:flutter/material.dart';

import '../Screen/view/HomePage/Homepage.dart';
import '../Screen/view/HomePage/detail.dart';
import '../Screen/view/Splash/splash.dart';

class Routes {
  static const splash = '/';
  static const home = 'home';
  static const add = 'home';
  static const detail = 'detail';

  static Map<String, Widget Function(BuildContext)> myRoute = {
    splash: (context) => const SplashScreen(),
    // home: (context) => const HomePage(),
    add: (context) => const HomePage(),
    detail: (context) => const DetailPage(),
  };
}
