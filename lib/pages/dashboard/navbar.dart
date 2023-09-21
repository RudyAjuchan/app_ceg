import 'package:asistencia_ceg/pages/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:asistencia_ceg/consts.dart';
import 'package:asistencia_ceg/utils/global.colors.dart';
import 'package:get/get.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text('Rudy Ajuchán'),
              accountEmail: const Text('rudy@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(child: Image.asset(avatarIcon)),
              ),
              decoration: BoxDecoration(
                color: GlobalColors.colorPrincipal,
                image: DecorationImage(
                  image: AssetImage(image4),
                  fit: BoxFit.cover,
                )
              ),
          ),
          ListTile(
            leading: Image.asset(homeIcon),
            title: const Text('Inicio'),
            onTap: () => {
              Get.to(Dashboard()),
            },
          ),
          ListTile(
            leading: Image.asset(notificacionIcon),
            title: const Text('Notificaciones'),
            onTap: () => {},
          ),
          ListTile(
            leading: Image.asset(calendarioIcon),
            title: const Text('Calendario Escolar'),
            onTap: () => {},
          ),
          ListTile(
            leading: Image.asset(justificarIcon),
            title: const Text('Justificar Asistencia'),
            onTap: () => {},
          ),
          ListTile(
            leading: Image.asset(asistenciaIcon),
            title: const Text('Reporte Asistencia'),
            onTap: () => {},
          ),
          ListTile(
            leading: Image.asset(estadisticaIcon),
            title: const Text('Estadisticas'),
            onTap: () => {},
          ),
          ListTile(
            leading: Image.asset(conversarIcon),
            title: const Text('Conversar'),
            onTap: () => {},
          ),
          ListTile(
            leading: Image.asset(ayudaIcon),
            title: const Text('Ayuda'),
            onTap: () => {},
          ),
          Divider(),
          ListTile(
            leading: Image.asset(cerrarIcon),
            title: const Text('Cerrar Sesión'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}