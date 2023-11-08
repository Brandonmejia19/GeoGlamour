import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoglamour/accesorio.dart';
import 'package:geoglamour/qr.dart';
import 'package:geoglamour/reportar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
//StatelessWidget {
  //@override
  //Widget build(BuildContext context) {
  //  return MaterialApp(
  //    debugShowCheckedModeBanner: false,
  //    home: MapScreen(),
  //  );
  //}

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {


  Timer miTimer = Timer.periodic(Duration(seconds: 20), (timer) {
    //Este codigo se ejecuta cada 20 segundos
  });

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(14.3208761, -91.0436988);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.satellite;


  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Casa gautemala',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 25,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget> [
                    FloatingActionButton(
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.add_location, size: 36.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  late GoogleMapController mapController;
  LatLng? _currentLocation;
  LatLng _initialLocation =
      const LatLng(13.565842, -89.115616); // Coordenadas iniciales
  // timer o bajo demanda de un boton
   // Invocar las coordenadas de x dispositivo  de la base de datos

  // Pintar en Mapa

  Marker _initialLocationMarker = Marker(
    markerId: const MarkerId("initial_location"),
    position: const LatLng(13.565842, -89.115616),
    // Ubicación inicial
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    // Icono personalizado (azul)
    infoWindow: const InfoWindow(
      title: "Ubicación Inicial",
      snippet: "Lat: ${13.565842}, Lng: ${-89.115616}",
    ),
  );

  _centerOnLocation() {

    if (_currentLocation != null) {
      mapController.animateCamera(CameraUpdate.newLatLng(_currentLocation!));
    } else {
      // Si no se pudo obtener la ubicación actual, regresa a la ubicación inicial
      mapController.animateCamera(CameraUpdate.newLatLng(_initialLocation));
    }
  }

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
            /* COMENTARIO PARA PRUEBA DE UBICACIO EN TIEMPO REAL*/
           ListTile(
              title: Text(
                'Escanear QR',
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
                  MaterialPageRoute(builder: (context) => QRCodeScannerPage()),
                ); // Cierra el Drawer
                // Agrega la lógica para navegar a la página "Acerca de" aquí
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  // Ajusta el valor de flex según tu preferencia para el ancho de la imagen
                  child: Image.asset('assets/collar.png'),
                  // Cambia 'ruta_de_la_imagen.png' por la ruta de tu imagen
                ),
                const SizedBox(width: 16.0),
                // Agrega espacio entre la imagen y el texto
                const Expanded(
                  flex: 3, // Ajusta el valor de flex para el ancho del texto
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información de la foto',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Descripción de la foto y detalles adicionales.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _initialLocation,
                    zoom: 16.0, // Ajusta el zoom según tus necesidades
                  ),
                  markers: {
                    const Marker(
                      markerId: MarkerId('Sydney'),
                      position: LatLng(-33.86, 151.20),
                    )
                  },
                ),
                Positioned(
                  top: 470,
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: _centerOnLocation,
                    // Define la función para centrar en la ubicación actual
                    child: Icon(Icons.my_location),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
