import 'package:flutter/material.dart';
import 'pages/Login/splash_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Centro Educativo Getsemaní',
        theme: ThemeData(fontFamily: "SF-Pro-Text"),
        home: const SplashView(),
      );
    }
}