// lib/main.dart
import 'package:flutter/material.dart';
import 'pantalla_inicio.dart'; // Asegúrate de importar tus archivos

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App Personal',
      // Cambia el widget home para probar las diferentes pantallas
      home: PantallaInicio(), // Cambiar por PantallaPerfil() o PantallaHobbies() [cite: 165]
    );
  }
}
