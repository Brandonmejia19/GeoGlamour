import 'package:flutter/material.dart';
import 'package:geoglamour/main.dart';
import 'package:geoglamour/reportar.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: nuevousuario(),
    );
  }
}

class nuevousuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accesorios'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => reportar()),
              );
            },
            child: Text('Reportar Accesorio Perdido'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('Registrar Nuevo Usuario'),
          ),
        ],
      ),
    );
  }
}

class RegisterUserScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Registro de Nuevo Usuario'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nombre de Usuario:'),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Escribe un nombre de usuario',prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Escribe una contraseña',prefixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {

                // Aquí puedes agregar la lógica para registrar al nuevo usuario
                String username = usernameController.text;
                String password = passwordController.text;

                // Puedes enviar estos datos a un servicio web o una base de datos
                // para su procesamiento.
                // Por ahora, simplemente mostraremos una alerta con los datos.

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Usuario Registrado'),
                      content: Text(
                        'Nombre de Usuario: $username\nContraseña: $password',//VARIABLES
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepOrange), // Cambia el color aquí
              ),
              child:Text('Registrar Usuario',),
            ),
          ],
        ),
      ),
    );
  }
}
