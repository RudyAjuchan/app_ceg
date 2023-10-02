import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/Login/splash_view.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:asistencia_ceg/api/firebase_api.dart';
import 'package:asistencia_ceg/pages/notificaciones/pantalla_notificacion.dart';

final navigatorKey = GlobalKey<NavigatorState>();
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
        navigatorKey: navigatorKey,
        home: const SplashView(),
        routes: {
          NotificationScreen.route: (context) => const NotificationScreen(),
        },
      );
    }
}