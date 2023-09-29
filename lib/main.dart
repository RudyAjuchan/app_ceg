import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/Login/splash_view.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:asistencia_ceg/api/firebase_api.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
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
        home: SplashView(),
      );
    }
}