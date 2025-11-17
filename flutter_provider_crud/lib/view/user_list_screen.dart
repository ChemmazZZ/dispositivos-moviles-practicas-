import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importar
import '../viewmodels/user_view_model.dart'; // Importar

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios en UserViewModel
    final viewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Usuarios')),
      body: ListView.builder(
        itemCount: viewModel.usuarios.length,
        itemBuilder: (context, index) {
          final user = viewModel.usuarios[index];
          return Card(
            child: ListTile(
              title: Text(user.nombre),
              subtitle: Text('${user.genero} - ${user.activo ? 'Activo' : 'Inactivo'}'),
            ),
          );
        },
      ),
    );
  }
}