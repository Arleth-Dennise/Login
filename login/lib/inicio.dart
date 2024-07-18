import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final correo = ModalRoute.of(context)!.settings.arguments as String;
    Color appBarColor;

    if (correo == 'arleth.oseguera@unah.hn') {
      appBarColor = Color.fromARGB(236, 255, 216, 239);
    } else if (correo == 'leslye.garcia@unah.hn') {
      appBarColor = Color.fromARGB(235, 255, 248, 211);
    } else {
      appBarColor = const Color.fromARGB(255, 201, 201, 201);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('$correo'),
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector( 
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/inicio_sesion');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: correo == 'arleth.oseguera@unah.hn'
               ? const CircleAvatar(
                    radius: 30, 
                    backgroundImage: AssetImage('assets/images/arleth.jpg'),
                  )
                : correo == 'leslye.garcia@unah.hn'
                 ? const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/leslye.jpg'),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola, $correo'),
            SizedBox(height: 20),
            correo == 'arleth.oseguera@unah.hn'
              ? Image.asset('assets/images/banner1.png', height: 200)
              : correo == 'leslye.garcia@unah.hn'
                ? Image.asset('assets/images/banner2.png', height: 200)
                : Container(),
          ],
        ),
      ),
    );
  }
}