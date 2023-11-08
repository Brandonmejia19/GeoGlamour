import 'package:flutter/material.dart';
import 'package:geoglamour/main.dart';
import 'package:geoglamour/nuevousuario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.person),
        title: Text('Inicio de Sesión'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logon.png',
              width: 250, // Ajusta el ancho según tus preferencias
              height: 250, // Ajusta la altura según tus preferencias
            ),

            Text(
              '',//TEXTO
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20.0),


            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre de usuario',
                prefixIcon: Icon(Icons.person),
              ),
            ),

            SizedBox(height: 10.0),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),

            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepOrange), // Cambia el color aquí
              ),
              child: Text('Iniciar sesión',
                  style: TextStyle(
                      color: Colors
                          .white)), // Cambia el color del texto si es necesario
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterUserScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepOrange), // Cambia el color aquí
              ),
              child: Text('Nuevo Usuario',
                  style: TextStyle(
                      color: Colors
                          .white)), // Cambia el color del texto si es necesario
            ),
            SizedBox(height: 10.0),

            TextButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                if (username == 'abigail' && password == 'itca123') {
                  // Las credenciales son válidas, redirige a la pantalla del mapa
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );
                } else {
                  // Las credenciales no son válidas, muestra un mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Credenciales incorrectas'),
                    ),
                  );
                }
                // Agrega la lógica para el restablecimiento de la contraseña o registro
              },
              child: Text('¿Olvidaste tu contraseña?'),
            ),
          ],
        ),
      ),
    );
  }
}
