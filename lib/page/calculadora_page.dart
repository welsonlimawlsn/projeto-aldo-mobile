import 'package:flutter/material.dart';
import 'package:projeto_aldo/form/numero_text_editing_controller.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({Key? key}) : super(key: key);

  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final _numeroUmController = NumeroTextEditingController();
  final _numeroDoisController = NumeroTextEditingController();
  var _resultado = '';

  _somar() {
    setState(() {
      _resultado = (_getNumeroUm + _getNumeroDois).toString();
    });
  }

  _subtrair() {
    setState(() {
      _resultado = (_getNumeroUm - _getNumeroDois).toString();
    });
  }

  _multiplicar() {
    setState(() {
      _resultado = (_getNumeroUm * _getNumeroDois).toString();
    });
  }

  _dividir() {
    setState(() {
      if (_getNumeroDois != 0) {
        _resultado = (_getNumeroUm / _getNumeroDois).toString();
      } else {
        _resultado = 'Não pode fazer divisão por zero!';
      }
    });
  }

  _calcularPorcentagem() {
    setState(() {
      _resultado = (_getNumeroUm / 100 * _getNumeroDois).toString();
    });
  }

  get _getNumeroDois => double.tryParse(_numeroDoisController.text) ?? 0.0;

  get _getNumeroUm => double.tryParse(_numeroUmController.text) ?? 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _numeroUmController,
              decoration: InputDecoration(
                labelText: 'Número 1:',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _numeroDoisController,
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
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(46, 36),
                    ),
                  ),
                  onPressed: _somar,
                  child: Text('+'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(46, 36),
                    ),
                  ),
                  onPressed: _subtrair,
                  child: Text('-'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(46, 36),
                    ),
                  ),
                  onPressed: _multiplicar,
                  child: Text('*'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(46, 36),
                    ),
                  ),
                  onPressed: _dividir,
                  child: Text('/'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(46, 36),
                    ),
                  ),
                  onPressed: _calcularPorcentagem,
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
