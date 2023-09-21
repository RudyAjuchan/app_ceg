import 'package:asistencia_ceg/consts.dart';
import 'package:flutter/material.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:asistencia_ceg/pages/dashboard/navbar.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: GlobalColors.colorPrincipal,
        ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(size.height*0.050),
          child: Image.asset(image3),
        ),
      ),
    );
  }
}