import 'package:flutter/material.dart';
import 'package:geoglamour/main.dart';
import 'package:geoglamour/reportar.dart';
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
String $text1 = 'sdad';

class accesorios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa Geoglamour',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                    Text(
                      'GeoGlamour',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Image.asset(
                      'assets/logo2.png',
                      width: 100, // Ajusta el ancho según tus preferencias
                      height: 98, // Ajusta la altura según tus preferencias
                    ), //
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text(
                  'Mapa',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  ); // Cierra el Drawer
                  // Agrega la lógica para navegar a la página de inicio aquí
                },
              ),
              ListTile(
                leading: Icon(Icons.diamond_rounded),
                title: Text(
                  'Accesorios',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => accesorios()),
                  ); // Cierra el Drawer
                  // Agrega la lógica para navegar a la página "Acerca de" aquí
                },
              ),
              ListTile(
                leading: Icon(Icons.report),
                title: Text(
                  'Reportar',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => reportar()),
                  ); // Cierra el Drawer
                  // Agrega la lógica para navegar a la página "Acerca de" aquí
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Colors.red,
                    // Cambia el color del texto a rojo
                    fontSize: 20.0,
                    // Cambia el tamaño de la fuente según tus preferencias
                    fontWeight: FontWeight
                        .bold, // Cambia el peso de la fuente según tus preferencias
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ); // Cierra el Drawer
                  // Agrega la lógica para navegar a la página "Acerca de" aquí
                },
              ),
            ],
          ),
        ),
        body:
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child:
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 0),
                    Icon(
                      Icons.location_on, // Puedes elegir cualquier icono que desees
                      size: 100, // Tamaño del ícono
                      color: Colors.deepOrange, // Color del ícono
                    ),
                    // Espacio entre la imagen y la información
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'Accesorios con Geolocalizador',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Accesorios en tu pertenencia',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ), //TITULO
                Divider(), //
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      // Ajusta el ancho de la imagen según tu preferencia
                      height: 150,
                      // Ajusta la altura de la imagen según tu preferencia
                      child: Image.asset(
                        'assets/img.png',
                      ), // Puedes reemplazarlo con tu propia imagen
                    ),
                    SizedBox(width: 20.0),
                    // Espacio entre la imagen y la información
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Collar para Mascotas',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'ID:1343124\n'
                                'Color: Blanco\n'
                                'Informacion: Collar para gatos pequeños\n'
                                'Dueño: Brandon Mejia\n',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          // Espacio entre el texto y los botones
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => reportar()),
                                  );
                                  // Agrega aquí la lógica para el botón de "Información"
                                },
                                child: Text('Reportar'),
                              ),
                              SizedBox(width: 16.0), // Espacio entre los botones
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen()),
                                  );
                                  // Agrega aquí la lógica para el botón de "Localizar"
                                },
                                child: Text('Localizar'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.deepOrange), // Cambia el color aquí
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      // Ajusta el ancho de la imagen según tu preferencia
                      height: 150,
                      // Ajusta la altura de la imagen según tu preferencia
                      child: Image.asset(
                        'assets/collar.png',
                      ), // Puedes reemplazarlo con tu propia imagen
                    ),
                    SizedBox(width: 20.0),
                    // Espacio entre la imagen y la información
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Collar para Personas',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'ID:2452325\n'
                                'Color: Negro\n'
                                'Informacion: Collar con Accesorio incluido\n'
                                'Dueño: Mercedes Abigail\n',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          // Espacio entre el texto y los botones
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => reportar()),
                                  );
                                  // Agrega aquí la lógica para el botón de "Información"
                                },
                                child: Text('Reportar'),
                              ),
                              SizedBox(width: 16.0), // Espacio entre los botones
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen()),
                                  );
                                  // Agrega aquí la lógica para el botón de "Localizar"
                                },
                                child: Text('Localizar'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.deepOrange), // Cambia el color aquí
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      // Ajusta el ancho de la imagen según tu preferencia
                      height: 150,
                      // Ajusta la altura de la imagen según tu preferencia
                      child: Image.asset(
                        'assets/img_1.png',
                      ), // Puedes reemplazarlo con tu propia imagen
                    ),
                    SizedBox(width: 20.0),
                    // Espacio entre la imagen y la información
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LLavero (Tiburon)',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'ID:9593842\n'
                                'Color: Plateado\n'
                                'Informacion: Llaver con forma de tiburon\n'
                                'Dueño: Lennyn Ascencio\n',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          // Espacio entre el texto y los botones
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => reportar()),
                                  );
                                  // Agrega aquí la lógica para el botón de "Información"
                                },
                                child: Text('Reportar'),
                              ),
                              SizedBox(width: 16.0), // Espacio entre los botones
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen()),
                                  );
                                  // Agrega aquí la lógica para el botón de "Localizar"
                                },
                                child: Text('Localizar'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.deepOrange), // Cambia el color aquí
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      // Ajusta el ancho de la imagen según tu preferencia
                      height: 150,
                      // Ajusta la altura de la imagen según tu preferencia
                      child: Image.asset(
                        'assets/img.png',
                      ), // Puedes reemplazarlo con tu propia imagen
                    ),
                    SizedBox(width: 20.0),
                    // Espacio entre la imagen y la información
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Collar para Mascotas',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'ID:4341123\n'
                                'Color: Rojo\n'
                                'Informacion: Collar para gato adulto\n'
                                'Dueño: Claudia Arely\n',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          // Espacio entre el texto y los botones
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => reportar()),
                                  );
                                  // Agrega aquí la lógica para el botón de "Información"
                                },
                                child: Text('Reportar'),
                              ),
                              SizedBox(width: 16.0), // Espacio entre los botones
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen()),
                                  );
                                  // Agrega aquí la lógica para el botón de "Localizar"
                                },
                                child: Text('Localizar'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.deepOrange), // Cambia el color aquí
                                ),
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
        )
    );
  }
}
