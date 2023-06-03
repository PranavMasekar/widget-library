import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widget_library/widgets/text_field.dart';

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
          child: useTextField(),
        ),
      ),
    );
  }
}
