import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Propio
import 'package:flutter_2_forms_app/config/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text("Cubits"),
            subtitle: const Text("Gestor de estado Simple"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push(AppRoutes.cubitCounter),
          ),
          ListTile(
            title: const Text("BloC"),
            subtitle: const Text("Gestor de estado Compuestos"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push(AppRoutes.blocCounter),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: const Text("Register"),
            subtitle: const Text("Registrar Usuario"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push(AppRoutes.registerScreen),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: const Text("Notificaciones"),
            subtitle: const Text("Prueba de notificaciones"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push(AppRoutes.notificationsScreen),
          ),
        ],
      ),
    );
  }
}
