// lib/pantalla_hobbies.dart

import 'package:flutter/material.dart';

class PantallaHobbies extends StatelessWidget {
  const PantallaHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Usa Scaffold [cite: 31]
      appBar: AppBar(
        title: const Text('Mis Hobbies e Intereses'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding( // Usa Padding [cite: 32]
          padding: const EdgeInsets.all(20.0),
          child: Column( // Usa Column [cite: 31]
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Actividades que me gustan:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              const SizedBox(height: 20),
              
              // Primer Hobby
              _buildHobbyItem(
                icon: Icons.book, 
                title: 'Lectura', 
                description: 'Leer novelas de fantasía y ciencia ficción para escapar de la realidad.',
                color: Colors.indigo,
              ),

              // Segundo Hobby
              _buildHobbyItem(
                icon: Icons.videogame_asset, 
                title: 'Videojuegos', 
                description: 'Jugar RPGs y juegos de estrategia en mi tiempo libre.',
                color: Colors.pink,
              ),
              
              // Tercer Hobby
              _buildHobbyItem(
                icon: Icons.music_note, 
                title: 'Música', 
                description: 'Escuchar y descubrir nuevos artistas de rock alternativo.',
                color: Colors.orange,
              ),

              // Cuarto Hobby (extra)
              _buildHobbyItem(
                icon: Icons.hiking, 
                title: 'Senderismo', 
                description: 'Explorar montañas y parques naturales los fines de semana.',
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para cada hobby
  Widget _buildHobbyItem({
    required IconData icon, 
    required String title, 
    required String description, 
    required Color color
  }) {
    return Padding( // Usa Padding [cite: 32]
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row( // Usa Row [cite: 31]
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container( // Usa Container [cite: 4]
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 35), // Usa Icon [cite: 20]
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column( // Usa Column [cite: 31]
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title, // Título del hobby [cite: 33]
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  description, // Descripción del hobby [cite: 33]
                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}