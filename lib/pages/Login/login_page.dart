import 'dart:developer';
import 'dart:io';

import 'package:asistencia_ceg/consts.dart';
import 'package:asistencia_ceg/pages/dashboard/dashboard.dart';
import 'package:asistencia_ceg/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget{
  LoginPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


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
                        controller: emailController,
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
                        controller: passwordController,
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
                        login(emailController.text, passwordController.text).then((res){
                          if(res!=null){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Dashboard();
                                },
                              ),
                            );
                          }else{
                            if (Platform.isIOS) {
                              showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: const Text("Información"),
                                    content: const Text("Usuario o contraseña inválidos"),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: const Text("Ok"),
                                        onPressed: () { Navigator.of(context).pop();},
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Información"),
                                    content: const Text("Usuario o contraseña inválidos"),
                                    actions: [
                                      TextButton(
                                        child: const Text("Ok"),
                                        onPressed: () {Navigator.of(context).pop();},
                                      ),
                                    ],
                                    elevation: 24,
                                  );
                                },
                              );
                            }
                          }
                        });
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
                      onPressed: () => AuthService().signInwithGoogle().then((user){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const Dashboard();
                            },
                          ),
                        );
                      }),
                      ),
                  ],
              ),
            ),
          )
      ),
    );
  }

  login(email, password) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return false;
      }
    }
  }

  
}