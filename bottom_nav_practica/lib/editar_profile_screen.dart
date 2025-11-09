// lib/editar_perfil_screen.dart

import 'package:flutter/material.dart';

// Pantalla Editar Perfil
class EditarPerfilScreen extends StatefulWidget {
  const EditarPerfilScreen({super.key});

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nombre de Usuario'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega hacia atrás y pasa el texto capturado
                Navigator.pop(context, _controller.text);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
  
  // Es importante liberar el controlador para evitar pérdidas de memoria (memory leak)
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}