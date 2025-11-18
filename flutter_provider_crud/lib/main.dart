import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/user_view_model.dart';
import 'views/user_list_screen.dart';

void main() {
  runApp(
    // Envuelve la aplicación con el Provider para que el ViewModel
    // esté disponible en todo el árbol de widgets.
    ChangeNotifierProvider(
      create: (context) => UserViewModel(),
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
      home: const UserListScreen(), // La pantalla principal es la lista
      debugShowCheckedModeBanner: false,
    );
  }
}