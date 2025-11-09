// lib/main.dart
import 'package:flutter/material.dart';
import 'editar_perfil_screen.dart'; // Importa la nueva pantalla

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación Inferior',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

// 1. StatefulWidget para manejar el estado de la pestaña
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // Índice de la pestaña seleccionada, inicializado a 0
  int _selectedIndex = 0; [cite_start]// [cite: 72]
  String _nombreUsuario = 'Usuario Invitado'; // Variable para el nombre en el Perfil

  // 2. Definición de las pantallas (Widgets) para cada pestaña
  [cite_start]// Incluye el nuevo tab "Perfil" [cite: 104]
  late final List<Widget> _pages;

  MyHomePageState() {
    _pages = [
      [cite_start]const Center(child: Text('Inicio', style: TextStyle(fontSize: 24))), // [cite: 74]
      [cite_start]const Center(child: Text('Usuarios', style: TextStyle(fontSize: 24))), // [cite: 74]
      [cite_start]const Center(child: Text('Configuración', style: TextStyle(fontSize: 24))), // [cite: 74, 75]
      _buildProfileTab(), // Implementación del tab "Perfil"
    ];
  }

  [cite_start]// Método para actualizar el índice de la pestaña [cite: 76]
  void _onItemTapped(int index) {
    setState(() {
      [cite_start]_selectedIndex = index; // [cite: 77, 78, 79]
    });
  }

  [cite_start]// Widget para la pestaña 'Perfil' [cite: 104]
  Widget _buildProfileTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 80, color: Colors.blue),
          const SizedBox(height: 20),
          Text(
            'Nombre: $_nombreUsuario',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            [cite_start]child: const Text('Editar perfil'), // [cite: 105, 127]
            onPressed: () async {
              [cite_start]// Navegar a la pantalla de edición y esperar un resultado [cite: 115]
              final nombre = await Navigator.push(
                context,
                MaterialPageRoute(
                  [cite_start]builder: (context) => const EditarPerfilScreen(), // [cite: 116, 117]
                ),
              );

              [cite_start]// 4. Usar setState para actualizar el estado con el dato devuelto [cite: 108]
              [cite_start]if (nombre != null && nombre is String && nombre.isNotEmpty) { // [cite: 119]
                setState(() {
                  [cite_start]_nombreUsuario = nombre; // Actualizar el nombre en pantalla [cite: 121, 122]
                }); [cite_start]// [cite: 120, 123]
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        [cite_start]title: const Text('Ejemplo BottomNavigationBar'), // [cite: 84, 85]
        backgroundColor: Colors.blue,
      ),
      [cite_start]body: _pages[_selectedIndex], // Mostrar el widget de la página seleccionada [cite: 86]
      [cite_start]bottomNavigationBar: BottomNavigationBar( // [cite: 87]
        [cite_start]currentIndex: _selectedIndex, // [cite: 88]
        [cite_start]onTap: _onItemTapped, // [cite: 89]
        type: BottomNavigationBarType.fixed, // Muestra 4 ítems correctamente
        [cite_start]items: const [ // [cite: 90]
          [cite_start]BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'), // [cite: 91, 92]
          [cite_start]BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Usuarios'), // [cite: 93, 94]
          [cite_start]BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'), // [cite: 95, 96]
          [cite_start]BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'), // [cite: 104]
        ],
      ),
    );
  }
}
