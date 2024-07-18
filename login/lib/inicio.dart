import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final correo = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('$correo'),
      ),


      body: Center(
        child: Text('Bienvenido, $correo'),
      ),
    );
  }
}