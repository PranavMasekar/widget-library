import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(340, 680),
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            title: 'Flutter Widget Library',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            home: const MyHomePage(),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                useTextField(),
                SizedBox(height: 15.h),
                useDropDown(),
                SizedBox(height: 15.h),
                useDashRectangle(),
                SizedBox(height: 15.h),
                useLoading(),
                SizedBox(height: 15.h),
                useDashLine(),
                SizedBox(height: 15.h),
                useGradientText(),
                SizedBox(height: 15.h),
                const UseCustomCheckBox(),
                SizedBox(height: 15.h),
                useTimerWidget(),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
