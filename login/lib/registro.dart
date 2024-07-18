import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 241, 246),
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
                    if (value!.length < 3 || value.length > 10) {
                      return 'El nombre debe tener entre 3 y 10 caracteres';
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
                    if (!value!.contains('@') ||!value.endsWith('.edu.hn')) {
                      return 'El correo debe ser válido y terminar con.edu.hn';
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
                    if (value!.length!= 8 || (value[0]!= '3' && value[0]!= '9' && value[0]!= '8')) {
                      return 'El teléfono debe tener 8 dígitos y empezar con 3 o 9';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                _CustomTextFormField(
                  controller: _passwordController,
                  prefixIcon: null,
                  suffixIcon: _obscureText? Icons.visibility_off : Icons.visibility,
                  labelText: 'Contraseña',
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value!.length < 8 ||!value.contains(RegExp(r'[A-Z]')) ||!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return 'minimo 8 letras, una mayúscula y un carácter especial';
                    }
                    return null;
                  },
                  onSuffixIconPressed: () {
                    setState(() {
                      _obscureText =!_obscureText;
                    });
                  },
                ),
                SizedBox(height: 10),
                _CustomTextFormField(
                  controller: _confirmPasswordController,
                  prefixIcon: null,
                  suffixIcon: _obscureConfirmPassword? Icons.visibility_off : Icons.visibility,
                  labelText: 'Confirmar contraseña',
                  obscureText: _obscureConfirmPassword,
                  validator: (value) {
                    if (value!= _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                  onSuffixIconPressed: () {
                    setState(() {
                      _obscureConfirmPassword =!_obscureConfirmPassword;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Registro exitoso!');
                      print('Nombre: ${_nameController.text}');
                      print('Correo: ${_emailController.text}');
                      print('Teléfono: ${_phoneController.text}');
                      print('Contraseña: ${_passwordController.text}');
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

class _CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String labelText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final VoidCallback? onSuffixIconPressed;

  _CustomTextFormField({
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconPressed,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<_CustomTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, size: 20) : null,
        suffixIcon: widget.suffixIcon!= null
           ? IconButton(
                icon: Icon(widget.suffixIcon, size: 20),
                onPressed: widget.onSuffixIconPressed,
              )
            : null,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      obscureText: widget.obscureText,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}