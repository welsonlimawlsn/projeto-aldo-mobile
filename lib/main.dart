import 'package:flutter/material.dart';
import 'package:projeto_aldo/page/agenda_telefonica_page.dart';
import 'package:projeto_aldo/page/calculadora_page.dart';
import 'package:projeto_aldo/page/inicio_page.dart';
import 'package:projeto_aldo/page/mapa_page.dart';
import 'package:projeto_aldo/page/navegador_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        Rotas.INICIO: (_) => InicioPage(),
        Rotas.CALCULADORA: (_) => CalculadoraPage(),
        Rotas.NAVEGADOR: (_) => NavegadorPage(),
        Rotas.AGENDA_TELEFONICA: (_) => AgendaTelefonicaPage(),
        Rotas.EU_NO_MAPA: (_) => MapaPage(),
      },
    );
  }
}

class Rotas {
  static const INICIO = '/';
  static const CALCULADORA = '/calculara';
  static const NAVEGADOR = '/navegador';
  static const AGENDA_TELEFONICA = '/agenda-telefonica';
  static const EU_NO_MAPA = '/mapa';
}
