import 'package:flutter/material.dart';
import 'package:geoglamour/main.dart';
import 'login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: accesorios(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange, // Color de fondo de la AppBar
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange, // Color de fondo de la AppBar
        ),
      ),
      home: accesorios(),
    );
  }
}

class accesorios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Accesorios'),
        backgroundColor: Colors.deepOrange,
      ),

      // Agrega el Drawer como parte del Scaffold
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                children: [
                  Text(
                    'GeoGlamour',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),Image.asset(
                    'logoblanco.png',
                    width: 1, // Ajusta el ancho según tus preferencias
                    height: 1, // Ajusta la altura según tus preferencias
                  ), //
                ],
              ),
            ),
            ListTile(
              title: Text('Mapa',
                style: TextStyle(
                    fontSize: 20
                ),),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>MapScreen()),); // Cierra el Drawer
                // Agrega la lógica para navegar a la página de inicio aquí
              },
            ),
            ListTile(
              title: Text('Accesorios',
                style: TextStyle(
                    fontSize: 20
                ),),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => accesorios()),); // Cierra el Drawer
                // Agrega la lógica para navegar a la página "Acerca de" aquí
              },
            ),
            ListTile(
              title: Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: Colors.red, // Cambia el color del texto a rojo
                  fontSize: 20.0, // Cambia el tamaño de la fuente según tus preferencias
                  fontWeight: FontWeight.bold, // Cambia el peso de la fuente según tus preferencias
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),); // Cierra el Drawer
                // Agrega la lógica para navegar a la página "Acerca de" aquí
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20.0), // Espacio entre la imagen y la información
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Accesorios con Geolocalizador',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Accesorios en tu pertenencia',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(), //
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80, // Ajusta el ancho de la imagen según tu preferencia
                  height: 100.0, // Ajusta la altura de la imagen según tu preferencia
                  child: FlutterLogo(size: 100.0), // Puedes reemplazarlo con tu propia imagen
                ),
                SizedBox(width: 20.0), // Espacio entre la imagen y la información
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información de la foto',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Descripción de la foto y detalles adicionales.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0), // Espacio entre el texto y los botones
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Agrega aquí la lógica para el botón de "Información"
                            },
                            child: Text('Información'),
                          ),
                          SizedBox(width: 16.0), // Espacio entre los botones
                          ElevatedButton(
                            onPressed: () {
                              // Agrega aquí la lógica para el botón de "Localizar"
                            },
                            child: Text('Localizar'),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
              ],
            ),
            Divider(), // Línea divisoria
            // Aquí puedes agregar otro cuadro similar
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80, // Ajusta el ancho de la imagen según tu preferencia
                  height: 100.0, // Ajusta la altura de la imagen según tu preferencia
                  child: FlutterLogo(size: 100.0), // Puedes reemplazarlo con tu propia imagen
                ),
                SizedBox(width: 20.0), // Espacio entre la imagen y la información
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información de la foto',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Descripción de la foto y detalles adicionales.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0), // Espacio entre el texto y los botones
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Agrega aquí la lógica para el botón de "Información"
                            },
                            child: Text('Información'),
                          ),
                          SizedBox(width: 16.0), // Espacio entre los botones
                          ElevatedButton(
                            onPressed: () {
                              // Agrega aquí la lógica para el botón de "Localizar"
                            },
                            child: Text('Localizar'),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
              ],
            ),
            Divider(), // Línea divisoria
            // Aquí puedes agregar otro cuadro similar
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80, // Ajusta el ancho de la imagen según tu preferencia
                  height: 100.0, // Ajusta la altura de la imagen según tu preferencia
                  child: FlutterLogo(size: 100.0), // Puedes reemplazarlo con tu propia imagen
                ),
                SizedBox(width: 20.0), // Espacio entre la imagen y la información
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información de la foto',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Descripción de la foto y detalles adicionales.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0), // Espacio entre el texto y los botones
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Agrega aquí la lógica para el botón de "Información"
                            },
                            child: Text('Información'),
                          ),
                          SizedBox(width: 16.0), // Espacio entre los botones
                          ElevatedButton(
                            onPressed: () {
                              // Agrega aquí la lógica para el botón de "Localizar"
                            },
                            child: Text('Localizar'),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
