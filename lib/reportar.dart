import 'package:flutter/material.dart';
import 'package:geoglamour/main.dart';
import 'accesorio.dart';
import 'login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: reportar(),
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

class reportar extends StatelessWidget {
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
            /* COMENTARIO PARA PRUEBA DE UBICACIO EN TIEMPO REAL
           ListTile(
              title: Text(
                'Pruebaaaa',
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
                  MaterialPageRoute(builder: (context) => MapScreen2()),
                ); // Cierra el Drawer
                // Agrega la lógica para navegar a la página "Acerca de" aquí
              },
            ),*/
          ],
        ),
      ),
      body: ReportAccessoryForm(),
    );
  }
}

class ReportAccessoryForm extends StatefulWidget {
  @override
  _ReportAccessoryFormState createState() => _ReportAccessoryFormState();
}

class _ReportAccessoryFormState extends State<ReportAccessoryForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Nombre del accesorio:'),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Ejemplo: Cartera, Llaves, Gafas, etc.',
            ),
          ),
          SizedBox(height: 16.0),
          Text('Descripción del accesorio perdido:'),
          TextFormField(
            controller: descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText:
              'Escribe una descripción detallada del accesorio perdido.',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes agregar la lógica para enviar el reporte del accesorio perdido
              String accessoryName = nameController.text;
              String accessoryDescription = descriptionController.text;

              // Puedes enviar estos datos a un servicio web o una base de datos
              // para su procesamiento.
              // Por ahora, simplemente mostraremos una alerta con los datos.

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Reporte Enviado'),
                    content: Text(
                      'Nombre del accesorio: $accessoryName\nDescripción: $accessoryDescription',
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
            child: Text('Reportar Accesorio Perdido'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.deepOrange), // Cambia el color aquí
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
