// lib/pantalla_inicio.dart

import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Usa Scaffold [cite: 31]
      appBar: AppBar(
        title: const Text('Bienvenido'), // AppBar con el título "Bienvenido" [cite: 9]
        backgroundColor: Colors.teal,
      ),
      body: Center( // Usa Center [cite: 32]
        child: Column( // Usa Column [cite: 31]
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text( // Usa Text [cite: 31]
              '¡Hola! Bienvenido a tu aplicación personal.', // Texto de bienvenida [cite: 10, 33]
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0), // Usa Padding [cite: 32]
              child: Text(
                'Aquí podrás ver tu perfil y tus intereses.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton( // Usa un botón (aunque no funcione aún) [cite: 11]
              onPressed: () {
                // Lógica vacía, ya que no se necesita navegación [cite: 6]
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'Ver mi perfil', // Texto del botón [cite: 11]
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
