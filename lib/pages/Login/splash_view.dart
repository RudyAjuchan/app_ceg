import 'dart:async';

import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:asistencia_ceg/pages/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
const SplashView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Timer(const Duration(seconds: 2),(){
      Get.to(LoginPage());
    });
    return Scaffold(
      backgroundColor: GlobalColors.colorPrincipal,
      body: Center(
        child: Image.asset('assets/images/logo_ceg2.png', height: 75,),                
      ),
    );
  }
}