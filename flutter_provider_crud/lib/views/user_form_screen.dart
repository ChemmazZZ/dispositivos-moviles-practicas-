import 'package:flutter/material.dart';
import '../models/user.dart';

class UserFormScreen extends StatefulWidget {
  // Parámetros opcionales para editar
  final User? usuario;
  final int? indice;

  const UserFormScreen({super.key, this.usuario, this.indice});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  // --- INICIO DEL CÓDIGO AÑADIDO EN COMMIT 12 ---

  // Clave global para identificar y validar el formulario
  final _formKey = GlobalKey<FormState>();
  
  // Variables para almacenar los valores del formulario
  late String _nombre;
  String _genero = 'Masculino'; // Valor por defecto
  bool _activo = true; // Valor por defecto

  @override
  void initState() {
    super.initState();
    
    // Comprueba si se pasó un usuario (modo edición)
    if (widget.usuario != null) {
      // Si estamos editando, precarga los datos del usuario
      _nombre = widget.usuario!.nombre;
      _genero = widget.usuario!.genero;
      _activo = widget.usuario!.activo;
    } else {
      // Si es un usuario nuevo, inicializa _nombre
      _nombre = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título dinámico
        title: Text(widget.usuario == null ? 'Agregar Usuario' : 'Editar Usuario'),
      ),
      // El body todavía es un placeholder en este commit
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Formulario en construcción..."),
      ),
    );
  }
}