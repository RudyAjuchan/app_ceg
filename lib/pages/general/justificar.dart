import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Justificar extends StatelessWidget {
  const Justificar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: const Text('Justificar inasistencia'),
          backgroundColor: GlobalColors.colorPrincipal,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Por favor ingrese el motivo de la justificación del alumno por el cual faltará o faltó, es necesario que deje el número de teléfono, ya que se le estará comunicando con su persona para validar la justificación',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                          hintText: "Escriba la justificación"),
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
                          hintText: "Ingrese el número de celular o teléfono"),
                    ),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
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
                        "Mandar  justificación",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
