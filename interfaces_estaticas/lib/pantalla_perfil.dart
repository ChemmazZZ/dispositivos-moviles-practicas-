// lib/pantalla_perfil.dart

import 'package:flutter/material.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Usa Scaffold [cite: 31]
      appBar: AppBar(
        title: const Text('Mi Perfil Personal'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding( // Usa Padding [cite: 32]
          padding: const EdgeInsets.all(20.0),
          child: Column( // Usa Column [cite: 31]
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container( // Usa Container [cite: 4]
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent, width: 4),
                  ),
                  child: ClipOval(
                    child: Image.network( // Usa Image.network [cite: 13, 31]
                      'https://picsum.photos/200/200', // URL de una imagen de ejemplo
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          width: 150,
                          height: 150,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => 
                        const SizedBox(
                          width: 150,
                          height: 150,
                          child: Center(child: Icon(Icons.person, size: 80)),
                        ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Usa SizedBox [cite: 32]
              
              const Text( // Tu nombre [cite: 14, 33]
                'José Maria Mamani Zuñiga',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              const Text( // Descripción (carrera/intereses) [cite: 14, 33]
                'Estudiante de Ingeniería en Desarrollo de Software y apasionado por Flutter.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              
              const Divider(height: 40, thickness: 2),

              const Text(
                'Contacto', // Información de contacto [cite: 15]
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),

              _buildContactRow(
                icon: Icons.email,
                text: 'jmamaniz@ulasalle.edu.pe',
                color: Colors.redAccent,
              ),

              _buildContactRow(
                icon: Icons.phone,
                text: '+51 987558263',
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para crear las filas de contacto
  Widget _buildContactRow({required IconData icon, required String text, required Color color}) {
    return Padding( // Usa Padding [cite: 32]
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row( // Usa Row con íconos [cite: 16, 31]
        children: <Widget>[
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 15),
          Text(
            text, // Texto personalizado [cite: 33]
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}