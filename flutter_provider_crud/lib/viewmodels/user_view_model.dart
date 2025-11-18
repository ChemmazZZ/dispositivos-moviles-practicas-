import 'package:flutter/material.dart';
import '../models/user.dart';

// Extiende de ChangeNotifier para poder usar notifyListeners()
class UserViewModel extends ChangeNotifier {
  
  // Lista privada de usuarios
  final List<User> _usuarios = [];

  // Getter público para que la Vista solo pueda LEER la lista
  List<User> get usuarios => _usuarios;

  // --- Operaciones CRUD ---

  // CREATE
  void agregarUsuario(User usuario) {
    _usuarios.add(usuario);
    notifyListeners(); // Avisa a los widgets que están escuchando
  }

  // UPDATE
  void editarUsuario(int index, User usuario) {
    _usuarios[index] = usuario;
    notifyListeners(); // Avisa del cambio
  }

  // DELETE
  void eliminarUsuario(int index) {
    _usuarios.removeAt(index);
    notifyListeners(); // Avisa de la eliminación
  }
}