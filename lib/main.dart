import 'package:bouncing_string/screens/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/constants.dart';
import 'config/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static AppStyle get style => _style;
  static final AppStyle _style = AppStyle();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '튕기는 줄',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: $style.colors.back,
        colorScheme: ColorScheme.fromSeed(seedColor: $style.colors.primary),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}
