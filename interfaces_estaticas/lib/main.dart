// lib/main.dart

import 'package:flutter/material.dart';
import 'pantalla_inicio.dart'; // Importa las pantallas
// import 'pantalla_perfil.dart';
// import 'pantalla_hobbies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App Personal', // Título de la aplicación [cite: 48]
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // Color base de la aplicación
      ),
      // Cambia 'PantallaInicio()' por 'PantallaPerfil()' o 'PantallaHobbies()' para probar [cite: 28, 49]
      home: const PantallaInicio(), 
    );
  }
}
