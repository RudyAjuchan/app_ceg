import 'dart:async';
import 'dart:developer';

import 'package:asistencia_ceg/pages/dashboard/dashboard.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:asistencia_ceg/pages/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asistencia_ceg/services/auth_service.dart';

class SplashView extends StatelessWidget {
const SplashView({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    Timer(const Duration(seconds: 2),(){
      AuthService().verificar().then((res){
        if(res=='no'){
          Get.to(const LoginPage());
        }else if(res=='si'){
          Get.to(const Dashboard());
        }
      });      
    });
    return Scaffold(
      backgroundColor: GlobalColors.colorPrincipal,
      body: Center(
        child: Image.asset('assets/images/logo_ceg2.png', height: 75,),                
      ),
    );
  }
}