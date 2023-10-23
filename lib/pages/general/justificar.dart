import 'package:asistencia_ceg/pages/dashboard/navbar.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Justificar extends StatelessWidget {
  Justificar({Key? key}) : super(key: key);
  final mensajeController = TextEditingController();
  final telefonoController = TextEditingController();

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
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 8, //or null
                      controller: mensajeController,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Escriba la justificación"),
                    ),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: telefonoController,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Ingrese el número de celular o teléfono"),
                    ),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  CupertinoButton(
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
                    onPressed: () {
                      if(mensajeController.text=="" || telefonoController.text==""){
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Información"),
                              content: const Text("Datos incompletos, la justificación y telefono son obligatorios"),
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
                      }else{
                        final user = FirebaseAuth.instance.currentUser!;
                        String email = user.email!;
                        var url = Uri.parse('https://apiceg.juliojodi.com/apiCEG/justificar');
                        final response = http.post(url, body: {'correo': email, 'telefono': telefonoController.text, 'descripcion': mensajeController.text});
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Información"),
                              content: const Text("Datos registrados con éxito"),
                              actions: [
                                TextButton(
                                  child: const Text("Ok"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    telefonoController.text="";
                                    mensajeController.text="";
                                    },
                                ),
                              ],
                              elevation: 24,
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
