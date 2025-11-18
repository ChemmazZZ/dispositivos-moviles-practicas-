import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';
import '../models/user.dart';
import 'user_form_screen.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch<UserViewModel>() se suscribe a los cambios.
    // Cuando el ViewModel llame a notifyListeners(), este widget se reconstruirá.
    final viewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Usuarios')),
      body: ListView.builder(
        itemCount: viewModel.usuarios.length,
        itemBuilder: (context, index) {
          final user = viewModel.usuarios[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(user.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${user.genero} - ${user.activo ? 'Activo' : 'Inactivo'}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- Botón Editar ---
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () async {
                      // Navega al formulario para editar
                      final usuarioActualizado = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserFormScreen(
                            usuario: user, // Pasa el usuario existente
                            indice: index, // Pasa el índice
                          ),
                        ),
                      );

                      // Si se recibió un usuario actualizado, llama al ViewModel
                      if (usuarioActualizado != null && usuarioActualizado is User) {
                        viewModel.editarUsuario(index, usuarioActualizado);
                      }
                    },
                  ),
                  // --- Botón Eliminar ---
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      viewModel.eliminarUsuario(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // --- Botón Flotante para Agregar ---
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // Navega al formulario para crear
          final nuevoUsuario = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserFormScreen()),
          );

          // Si se recibió un nuevo usuario, llama al ViewModel
          if (nuevoUsuario != null && nuevoUsuario is User) {
            viewModel.agregarUsuario(nuevoUsuario);
          }
        },
      ),
    );
  }
}