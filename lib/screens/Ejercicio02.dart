import 'package:flutter/material.dart';

class Ejercicio02Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 02'),
      ),
      body: Ejercicio02Body(),
    );
  }
}

class Ejercicio02Body extends StatefulWidget {
  @override
  _Ejercicio02BodyState createState() => _Ejercicio02BodyState();
}

class _Ejercicio02BodyState extends State<Ejercicio02Body> {
  TextEditingController alturaController = TextEditingController();
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo04.jpg'), // Reemplaza con tu imagen
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (m)',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  double rho = 1025; // Densidad del agua de mar en kg/m^3
                  double g = 9.8; // Gravedad en m/s^2
                  double h = double.parse(alturaController.text);

                  double p = rho * g * h;

                  setState(() {
                    resultado = 'La presión es: $p Pa';
                  });
                },
                child: Text('Calcular'),
              ),
              Text(
                resultado,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}