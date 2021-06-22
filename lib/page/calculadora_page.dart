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
    var numero1 = double.tryParse(numeroUmController.text) ?? 0.0;
    var numero2 = double.tryParse(numeroDoisController.text) ?? 0.0;

    setState(() {
      _resultado = (numero1 + numero2).toString();
    });
  }

  subtrair() {
    var numero1 = double.tryParse(numeroUmController.text) ?? 0.0;
    var numero2 = double.tryParse(numeroDoisController.text) ?? 0.0;

    setState(() {
      _resultado = (numero1 - numero2).toString();
    });
  }

  multiplicar() {
    var numero1 = double.tryParse(numeroUmController.text) ?? 0.0;
    var numero2 = double.tryParse(numeroDoisController.text) ?? 0.0;

    setState(() {
      _resultado = (numero1 * numero2).toString();
    });
  }

  dividir() {
    var numero1 = double.tryParse(numeroUmController.text) ?? 0.0;
    var numero2 = double.tryParse(numeroDoisController.text) ?? 0.0;

    setState(() {
      if (numero2 != 0) {
        _resultado = (numero1 / numero2).toString();
      } else {
        _resultado = 'Não pode fazer divisão por zero!';
      }
    });
  }

  calculaPorcentagem() {
    var numero1 = double.tryParse(numeroUmController.text) ?? 0.0;
    var numero2 = double.tryParse(numeroDoisController.text) ?? 0.0;

    setState(() {
      _resultado = (numero1 / 100 * numero2).toString();
    });
  }

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
            )
          ],
        ),
      ),
    );
  }
}
