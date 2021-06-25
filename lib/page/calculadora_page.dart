import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({Key? key}) : super(key: key);

  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final numeroUmController = new TextEditingController();
  final numeroDoisController = TextEditingController();
  var _resultado = "";

  somar() {
    setState(() {
      _resultado = (getNumeroUm() + getNumeroDois()).toString();
    });
  }

  subtrair() {
    setState(() {
      _resultado = (getNumeroUm() -  getNumeroDois()).toString();
    });
  }

  multiplicar() {
    setState(() {
      _resultado = (getNumeroUm() *  getNumeroDois()).toString();
    });
  }

  dividir() {
    setState(() {
      if (getNumeroDois() != 0) {
        _resultado = (getNumeroUm() /  getNumeroDois()).toString();
      } else {
        _resultado = 'Não pode fazer divisão por zero!';
      }
    });
  }

  calculaPorcentagem() {
    setState(() {
      _resultado = (getNumeroUm() / 100 *  getNumeroDois()).toString();
    });
  }

  double getNumeroDois() => double.tryParse(numeroDoisController.text) ?? 0.0;

  double getNumeroUm() => double.tryParse(numeroUmController.text) ?? 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: numeroUmController,
              decoration: InputDecoration(
                labelText: 'Número 1:',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: numeroDoisController,
              decoration: InputDecoration(
                labelText: 'Número 2:',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            if (_resultado.isNotEmpty)
              FittedBox(
                child: Text(
                  'Resultado: ' + _resultado,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: somar,
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: subtrair,
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: multiplicar,
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: dividir,
                  child: Text('/'),
                ),
                ElevatedButton(
                  onPressed: calculaPorcentagem,
                  child: Text('%'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
