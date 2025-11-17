import 'package:flutter/material.dart';
import '../models/user.dart';

class UserViewModel extends ChangeNotifier {
  // Lista privada
  final List<User> _usuarios = [];

  // Getter público
  List<User> get usuarios => _usuarios;
  
  void agregarUsuario(User usuario) {
  _usuarios.add(usuario);
  notifyListeners(); // Notifica a los listeners
  }
  
  void eliminarUsuario(int index) {
    _usuarios.removeAt(index);
    notifyListeners(); // Notifica a los listeners
  }

  void editarUsuario(int index, User usuario) {
  _usuarios[index] = usuario;
  notifyListeners(); // tambien notifica a los listeners
  }

}
