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
      backgroundColor: Color.fromARGB(255, 246, 245, 240),
      //appBar: AppBar(
        //title: const Text('registro'),
        //backgroundColor: Color.fromARGB(255, 246, 245, 240),
        //foregroundColor: Color.fromARGB(255, 97, 22, 108),
      //),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset('assets/images/imagen2.png', height: 200),
                SizedBox(height: 10),

                _CustomTextFormField(
                  controller: _nameController,
                  prefixIcon: Icons.person,
                  labelText: 'Nombre',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
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
                    if (value!.isEmpty ||!value.contains('@')) {
                      return 'Please enter a valid email';
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
                      return 'Please enter your phone number';
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
                      return 'Please enter your password';
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
                    if (value!= _passwordController.text) {
                      return 'Passwords do not match';
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
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 39, 34, 2), 
                    backgroundColor: Color.fromARGB(255, 255, 249, 168), // Color del texto del botón
                    textStyle: TextStyle(fontSize: 18), // Tamaño del texto del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Forma del botón
                    ),
                  ),
                  child: Text('Registrarse'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inicio_sesion');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 84, 17, 42), 
                    textStyle: TextStyle(fontSize: 16), // Tamaño del texto
                  ),
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