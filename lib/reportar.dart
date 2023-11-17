import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoglamour/main.dart';
import 'package:geoglamour/views/login_page.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
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
        title: const Text(' Geoglamour',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 9, 14, 16),
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
              leading: Icon(Icons.map,color: Colors.lightGreen,),
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
              leading: Icon(Icons.diamond_rounded,color: Colors.lightBlue,),
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
              leading: Icon(Icons.report,color: Colors.deepOrange,),
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
              leading: Icon(Icons.exit_to_app,color: Colors.red,),
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
                QuickAlert.show(
      context: context,
      text: '¿Realmente desea cerrar su sesión?',
      type: QuickAlertType.confirm,
      onConfirmBtnTap: (){
        FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context, "/login");
      }
    ); 
                //Navigator.push(
                 // context,
                 // MaterialPageRoute(builder: (context) => LoginPage()),
               // ); // Cierra el Drawer

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
  final TextEditingController comentarioController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
        children: [
          Text('Nombre del accesorio:'),
          TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: 'Ejemplo: Cartera, Llaves, Gafas, etc.',
          labelText: '',
          labelStyle: TextStyle(color: const Color.fromARGB(255, 15, 16, 17)),
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.diamond, color: Color.fromARGB(255, 188, 4, 4)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: const Color.fromARGB(255, 1, 2, 2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: const Color.fromARGB(255, 20, 20, 21), width: 2.0),
          ),
        ),
          ),
        ],
      ),
      
            Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Text('Descripción del accesorio perdido:', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          TextFormField(
        controller: descriptionController,
        maxLines: 5,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.description, color: Color.fromARGB(255, 188, 4, 4)), // Icono a la izquierda
          hintText: 'Escribe una descripción detallada del accesorio perdido.',
          labelText: '',
          labelStyle: TextStyle(color: const Color.fromARGB(255, 6, 6, 6)),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: const Color.fromARGB(255, 13, 13, 13)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: const Color.fromARGB(255, 4, 4, 4), width: 2.0),
          ),
        ),
          ),
        ],
      ),
      
      
            Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Número de teléfono', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.0),
          TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: 'Teléfono',
          labelText: '',
          labelStyle: TextStyle(color: const Color.fromARGB(255, 15, 16, 17)),
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.phone_android, color:  Color.fromARGB(255, 245, 5, 5)), // Icono a la izquierda
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: const Color.fromARGB(255, 1, 2, 2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: const Color.fromARGB(255, 20, 20, 21), width: 2.0),
          ),
        ),
          ),
        ],
      ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
              children: [
                Text('Comentario:'),
                TextFormField(
                  controller: comentarioController,
                  decoration: InputDecoration(
                    hintText: 'Da tu opinion',
                    labelText: '',
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 15, 16, 17)),
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 188, 4, 4)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 1, 2, 2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 20, 20, 21), width: 2.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para enviar el reporte del accesorio perdido
                String accessoryName = nameController.text;
                String accessoryDescription = descriptionController.text;
                String accessoryCo = comentarioController.text;

                // Puedes enviar estos datos a un servicio web o una base de datos
                // para su procesamiento.
                // Por ahora, simplemente mostraremos una alerta con los datos.
      
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Reporte Enviado'),
                      content: Text(
                        'Nombre del accesorio: $accessoryName\nDescripción: $accessoryDescription'
                            '\ncomentario: $accessoryCo',

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
              child: Text('Reportar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.red), // Cambia el color aquí
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    comentarioController.dispose();
    super.dispose();
  }
}
