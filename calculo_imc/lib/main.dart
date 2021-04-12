import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final valorAltura = TextEditingController();
  final valorPeso = TextEditingController();
  String resultante = "0.0";
  String altura = "0.0";
  String peso = "0.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('VEJA SEU IMC')),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "CALCULO IMC",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
            ),
            SizedBox(
              height: 130,
            ),
            TextField(
                controller: valorPeso,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'digite o peso',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Seu peso',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: valorAltura,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'digite a altura',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Sua altura',
                  labelStyle: new TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            ButtonTheme(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    final double valorPesoFinal =
                        double.parse((valorPeso.text));
                    peso = "$valorPesoFinal";

                    final double valorAlturaFinal =
                        double.parse((valorAltura.text));
                    altura = "$valorAlturaFinal";
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Valores(peso, altura)),
                  );
                },
                child: Text('Converter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Valores extends StatelessWidget {
  final String pesoRecebe;
  final String alturaRecebe;

  Valores(this.pesoRecebe, this.alturaRecebe);

  String calculo(double peso, double altura) {
    var valor = (peso / (altura * altura));
    if (valor < 18.5) {
      return "MAGREZA";
    } else if (valor >= 18.5 && valor <= 24.9) {
      return "NORMAL";
    } else if (valor >= 25 && valor <= 29.9) {
      return "SOBREPESO";
    } else if (valor >= 30 && valor <= 39.9) {
      return "OBESIDADE";
    } else if (valor >= 40) {
      return "OBESIDADE GRAVE";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('RESULTADO')),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Seu estado de imc é: ${calculo(double.parse(pesoRecebe), double.parse(alturaRecebe))}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
