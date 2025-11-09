// lib/main.dart

import 'package:flutter/material.dart';
// ¡Esta línea requiere que el archivo exista!
import 'editar_profile_screen.dart'; 

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => MyHomePageState(); 
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _nombreUsuario = 'Usuario Invitado';

  late final List<Widget> _pages;

  MyHomePageState() {
    _pages = [
      const Center(child: Text('Inicio', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Usuarios', style: TextStyle(fontSize: 24))),
      const Center(child: Text('Configuración', style: TextStyle(fontSize: 24))),
      _buildProfileTab(), // Pestaña Perfil
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            child: const Text('Editar perfil'),
            onPressed: () async {
              final nombre = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditarPerfilScreen(),
                ),
              );

              if (nombre != null && nombre is String && nombre.isNotEmpty) {
                setState(() {
                  _nombreUsuario = nombre;
                });
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
        title: const Text('Ejemplo BottomNavigationBar'),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Usuarios'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}