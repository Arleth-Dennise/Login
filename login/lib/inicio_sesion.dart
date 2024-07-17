import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 245, 240),
      //appBar: AppBar(
        //title: const Text('Iniciar sesión'),
        //backgroundColor: Color.fromARGB(255, 246, 245, 240),
        //foregroundColor: Color.fromARGB(255, 97, 22, 108),
      //),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset('assets/images/imagen1.png', height: 200),
              SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _CustomTextFormField(
                      controller: _emailController,
                      prefixIcon: Icons.email,
                      labelText: 'Correo',
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Ingrese un email valido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Inicio de sesión exitoso!');
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 39, 34, 2), 
                    backgroundColor: Color.fromARGB(255, 255, 137, 180), // Color del texto del botón
                    textStyle: TextStyle(fontSize: 18), // Tamaño del texto del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Forma del botón
                      ),
                    ),
                      child: Text('Iniciar sesión'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registro');
                      },
                      style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 59, 56, 10), 
                    textStyle: TextStyle(fontSize: 16), // Tamaño del texto
                  ),
                      child: Text('¿No tienes una cuenta? Regístrate'),
                    ),
                  ],
                ),
              ),
            ],
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