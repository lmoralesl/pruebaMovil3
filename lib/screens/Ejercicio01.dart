import 'package:flutter/material.dart';

class Ejercicio01Body extends StatefulWidget {
  @override
  _Ejercicio01BodyState createState() => _Ejercicio01BodyState();
}

class _Ejercicio01BodyState extends State<Ejercicio01Body> {
  TextEditingController velocidadInicialController = TextEditingController();
  TextEditingController velocidadFinalController = TextEditingController();
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo02.jpeg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: velocidadInicialController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Velocidad inicial (V)',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              TextField(
                controller: velocidadFinalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Velocidad final (Vf)',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  double v = double.parse(velocidadInicialController.text);
                  double vf = double.parse(velocidadFinalController.text);
                  double t = (vf - v) / 10; // Asumiendo que la aceleración media es siempre 10 m/s^2

                  if (t < 0) {
                    setState(() {
                      resultado = 'El vehículo no aprueba';
                    });
                  } else {
                    setState(() {
                      resultado = 'El vehículo aprueba';
                    });
                  }
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