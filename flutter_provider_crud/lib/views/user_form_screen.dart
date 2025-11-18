import 'package:flutter/material.dart';
import '../models/user.dart';

class UserFormScreen extends StatefulWidget {
  // Parámetros opcionales. Si se reciben, es modo "Editar".
  final User? usuario;
  final int? indice;

  const UserFormScreen({super.key, this.usuario, this.indice});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  // Clave para validar el formulario
  final _formKey = GlobalKey<FormState>();

  // Estado local del formulario
  late String _nombre;
  String _genero = 'Masculino'; // Valor por defecto
  bool _activo = true; // Valor por defecto

  @override
  void initState() {
    super.initState();
    // Si se pasó un usuario (modo edición), precarga los datos
    if (widget.usuario != null) {
      _nombre = widget.usuario!.nombre;
      _genero = widget.usuario!.genero;
      _activo = widget.usuario!.activo;
    } else {
      // Si es "modo crear", inicializa el nombre vacío
      _nombre = '';
    }
  }

  void _guardarFormulario() {
    // Valida el formulario
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Guarda los valores de los campos
      
      // Crea el objeto User con los datos del formulario
      final user = User(nombre: _nombre, genero: _genero, activo: _activo);
      
      // Regresa a la pantalla anterior devolviendo el usuario
      Navigator.pop(context, user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título dinámico
        title: Text(widget.usuario == null ? 'Agregar Usuario' : 'Editar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView( // Usamos ListView para evitar overflow del teclado
            children: [
              // --- Campo Nombre ---
              TextFormField(
                initialValue: _nombre,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ingrese un nombre válido' : null,
                onSaved: (value) => _nombre = value!,
              ),
              const SizedBox(height: 20),

              // --- Campo Género (Radio) ---
              const Text('Género', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Masculino'),
                      value: 'Masculino',
                      groupValue: _genero,
                      onChanged: (value) => setState(() => _genero = value!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Femenino'),
                      value: 'Femenino',
                      groupValue: _genero,
                      onChanged: (value) => setState(() => _genero = value!),
                    ),
                  ),
                ],
              ),

              // --- Campo Activo (Switch) ---
              SwitchListTile(
                title: const Text('Usuario Activo'),
                value: _activo,
                onChanged: (value) => setState(() => _activo = value),
              ),
              const SizedBox(height: 30),

              // --- Botón Guardar/Actualizar ---
              ElevatedButton(
                onPressed: _guardarFormulario,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18)
                ),
                child: Text(widget.usuario == null ? 'Guardar' : 'Actualizar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}