import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importar
import 'viewmodels/user_view_model.dart'; // Importar
import 'views/user_list_screen.dart'; // Importar

void main() {
  runApp(
    // Envuelve la app con el Provider
    ChangeNotifierProvider(
      create: (context) => UserViewModel(), // Crea la instancia
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Usuarios',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const UserListScreen(), // Actualizar home
    );
  }
}