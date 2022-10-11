import 'package:books_app/presentation/home/view/home_page.dart';
import 'package:books_app/presentation/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home' : (_) => HomePage()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor:  AppColors.primary
        )
      ),
    );
  }
}
