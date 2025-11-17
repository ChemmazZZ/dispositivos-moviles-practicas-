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
}
