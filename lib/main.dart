import 'package:flutter/material.dart';
import 'package:prueba_movil3/screens/Ejercicio01.dart';
import 'package:prueba_movil3/screens/Ejercicio02.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'MOVIL3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PruebaScreen(),
    Ejercicio01Body(),
    Ejercicio02Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba'),
      ),
       body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo01.jpeg'), // Ruta de la imagen local
            fit: BoxFit.cover,
          ),
        ),
        child: _children[_currentIndex],
      ),

        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Prueba',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Ejercicio 01',
          ),
          
        ],
      ),
    );
  }
}

class PruebaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nombre del estudiante: Luis Morales',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Usuario de GitHub: luirimo@hotmail.com',
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Ir al Ejercicio 02'),
                    content: Text('¿Desea ir al Ejercicio 02?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ejercicio02Screen(),
                            ),
                          );
                        },
                        child: Text('Sí'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Ir al Ejercicio 02'),
          ),
        ],
      ),
    );
  }
}
