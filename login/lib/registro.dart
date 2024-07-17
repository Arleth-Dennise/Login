import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 240, 246),
      appBar: AppBar(
        title: const Text('registro'),
        backgroundColor: Color.fromARGB(255, 245, 240, 246),
        foregroundColor: Color.fromARGB(255, 97, 22, 108),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _CustomTextFormField(
                  controller: _nameController,
                  prefixIcon: Icons.person,
                  labelText: 'Nombre',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese su nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                _CustomTextFormField(
                  controller: _emailController,
                  prefixIcon: Icons.email,
                  labelText: 'Correo',
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Ingreese su correo';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                _CustomTextFormField(
                  controller: _phoneController,
                  prefixIcon: Icons.phone,
                  labelText: 'Teléfono',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese su numero de telefono';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                _CustomTextFormField(
                  controller: _passwordController,
                  prefixIcon: null,
                  suffixIcon: Icons.visibility,
                  labelText: 'Contraseña',
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                _CustomTextFormField(
                  controller: _confirmPasswordController,
                  prefixIcon: null,
                  suffixIcon: Icons.visibility,
                  labelText: 'Confirmar contraseña',
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'La contraseña no es la misma';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Registro exitoso!');
                      Navigator.pushReplacementNamed(context, '/inicio');
                    }
                  },
                  child: Text('Registrarse'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inicio_sesion');
                  },
                  child: Text('¿Ya tienes una cuenta? Iniciar sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String labelText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;

  _CustomTextFormField({
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 20) : null,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}