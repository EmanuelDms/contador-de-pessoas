// Importa Widgets relacionados ao Material Design
import 'package:flutter/material.dart';

void main() {
  // runApp roda o app que exige um Widget, sendo esse do Material Design
  runApp(MaterialApp(
      // Title é o título do app
      title: "Contador de Pessoas",
      /**
       * 'home' é o widget para a rota padrão do App;
       * 'Container' é um widget da tela do app;
       */
      home: Home()));
}

// Cria classe Home herdando Statefulwidget, ou seja, o estado interno irá mudar
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // indica que essa variável será acessada internamente (getters and setters)
  int _people = 0;
  String _infoText = "Pode Entrar!";

// Altera valor das pessoas
  void _changePeople(int delta) {
    // Renderiza a tela a partir das mudanças feitas
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = 'Mundo invertido?!';
      } else if (_people <= 10) {
        _infoText = 'Pode Entrar!';
      } else {
        _people -= delta;
        _infoText = 'Lotado!';
      }
    });
  }

  // função build é chamada quanto queremos mudar algo no layout
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          // preenchimento
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          // Alinhamento Vertical
          mainAxisAlignment: MainAxisAlignment.center,
          // filhos da colunas
          children: <Widget>[
            // <conteúdo do texto>, <estilo>
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    // Increment (+)
                    child: FlatButton(
                        // Child vai pe rmitir que coloque apenas um único widget como filho;
                        child: Text(
                          "+1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        // Evento que dispara uma função
                        onPressed: () {
                          _changePeople(1);
                        })),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    // Decrement (-)
                    child: FlatButton(
                        // Child vai pe rmitir que coloque apenas um único widget como filho;
                        child: Text(
                          "-1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        // Evento que dispara uma função
                        onPressed: () {
                          _changePeople(-1);
                        })),
              ],
            ),
            Text(
              "$_infoText",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
