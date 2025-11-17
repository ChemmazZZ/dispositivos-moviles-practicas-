import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/user_view_model.dart';
import 'views/user_list_screen.dart';

void main() {
  runApp(
    // 1. Envuelve la app con el Provider
    ChangeNotifierProvider(
      // 2. Crea la instancia del ViewModel que manejará el estado
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
      // 3. El home de la app es la pantalla que lista los usuarios
      home: const UserListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}