import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Mis datos 2',
          ),
        ),
        body: DicesPage(),
        backgroundColor: Colors.red,
      ),
    );
  }
}

// TODO: Uso de random para mostrar los dados
// TODO: Tarea APP2, Utilizar 7 bandas (flat button o otro wiget q tengo el evento de click, elineados en una columna), utilizar expanded
// al hacer click en uno de ellos, reproducir una nota musical
// Utilizar la libreria

class DicesPage extends StatefulWidget {
  @override
  _DicesPageState createState() => _DicesPageState();
}

class _DicesPageState extends State<DicesPage> {
  int dadoIzquierdo = 1;
  int dadoDerecho = 2;
  final _random = new Random();

  int randomDice(int min, int max) => min + _random.nextInt(max - min);

  void changeDiceValue() {
    setState(() {
      dadoIzquierdo = randomDice(1, 6);
      dadoDerecho = randomDice(1, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: changeDiceValue,
              child: Image.asset(
                'images/dice$dadoIzquierdo.png',
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: changeDiceValue,
              child: Image.asset(
                'images/dice$dadoDerecho.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
