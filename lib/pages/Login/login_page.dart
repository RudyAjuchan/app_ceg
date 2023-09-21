import 'package:asistencia_ceg/consts.dart';
import 'package:asistencia_ceg/pages/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [g1, g2]
            ),
        ),
        child: 
        SingleChildScrollView(
          child:
            Padding(
              padding: EdgeInsets.all(size.height*0.050),
              child: OverflowBar(
                overflowSpacing: size.height * 0.014,
                overflowAlignment: OverflowBarAlignment.center,
                children: [
                    Image.asset(image2),
                    Image.asset(image1),                
                    const Text(
                      "Inicia sesión para continuar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: kWhiteColor,
                      ),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: kInputColor),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
                          filled: true,
                          hintText: "Correo",
                          prefixIcon: IconButton(
                            onPressed: (){},
                            icon: Image.asset(mailIcon),
                          ),
                          fillColor: kWhiteColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(37)
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: kInputColor),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
                          filled: true,
                          hintText: "Contraseña",
                          prefixIcon: IconButton(
                            onPressed: (){},
                            icon: Image.asset(keyIcon),
                          ),
                          fillColor: kWhiteColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(37)
                          ),
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: size.height * 0.080,
                          decoration: BoxDecoration(
                            color: kButtonColor,
                            borderRadius: BorderRadius.circular(37),
                          ),
                          child: const Text(
                              "Ingresar",
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ),
                      onPressed: (){
                        Get.to(Dashboard());
                      },
                      ),
                      SizedBox(height: size.height * 0.014),
                      Image.asset(separatorIcon),
                      SizedBox(height: size.height * 0.014),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: size.height * 0.080,
                          decoration: BoxDecoration(
                            color: kButtonColor2,
                            borderRadius: BorderRadius.circular(37),
                          ),
                          child: Image.asset(googleIcon),
                        ),
                      onPressed: (){},
                      ),
                  ],
              ),
            ),
          )
      ),
    );
  }
}