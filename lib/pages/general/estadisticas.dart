import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/pages/graficas/grafica_linear.dart';
import 'package:asistencia_ceg/pages/graficas/grafica_linearS.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:asistencia_ceg/pages/graficas/grafica_circular.dart';

class Estadisticas extends StatelessWidget {
const Estadisticas({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Estadísticas de asistencia'),
        backgroundColor: GlobalColors.colorPrincipal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GraficaCircular(),
            GraficaLinear(),
            GraficaLinearS(),
          ],
        ),
      ),
    );
  }


}