import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asistencia_ceg/consts.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Ayuda Técnica'),
        backgroundColor: GlobalColors.colorPrincipal,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.050),
            child: Column(
                  children: <Widget>[
                    Image.asset(supportIcon),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Por favor ingrese los datos para darle seguimiento a los inconvenientes que tenga',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Card(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 8, //or null
                        decoration: InputDecoration.collapsed(
                            hintText: "Escriba la descripción del problema"),
                      ),
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Card(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Ingrese su nombre"),
                      ),
                    )),
                    const Card(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Ingrese el número de celular o teléfono"),
                      ),
                    )),
                    CupertinoButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: size.height * 0.080,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade900,
                          borderRadius: BorderRadius.circular(37),
                        ),
                        child: const Text(
                          "Reportar problema",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'O comuniquese al correo electrónico rajuchan@cegetsemani.edu.gt y a soporte@cegetsemani.edu.gt para reportar algún problema o ayuda que necesite',
                      style: TextStyle( fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
