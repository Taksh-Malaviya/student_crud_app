import 'package:exam_app/Add_data.dart';
import 'package:exam_app/Screen/view/Splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routes/routes.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.myRoute,
        // home: HomePage(),
      ),
    );
  }
}
