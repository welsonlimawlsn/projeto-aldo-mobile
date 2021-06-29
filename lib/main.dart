import 'package:flutter/material.dart';
import 'package:projeto_aldo/page/agenda_telefonica_page.dart';
import 'package:projeto_aldo/page/calculadora_page.dart';
import 'package:projeto_aldo/page/inicio_page.dart';
import 'package:projeto_aldo/page/mapa_page.dart';
import 'package:projeto_aldo/page/navegador_page.dart';

/**
 * METODO PRINCIPAL
 *
 * A APLICAÇÃO INICIA AQUI
 *
 * CHAMA O PRIMEIRO WIDGET DA ARVORE
 */
void main() {
  runApp(MyApp());
}

/// PRIMEIRO WIDGET DA ARVORE
class MyApp extends StatelessWidget {

  /// IMPLEMENTAÇÃO DO METODO build, QUE REALIZA A CONSTRUÇÃO DA ARVORE DE
  /// WIDGETS QUE IRÁ COMPOR A INTERFACE DO APLICATIVO
  @override
  Widget build(BuildContext context) {

    /**
     * RETORNA O WIDGET MaterialApp.
     *
     * ELE ENVOLVE OS WIDGETS DE DESIGN MAS USADOS EM UMA APLICAÇÃO E CONTEMPLA
     * A FUNCIONALIDADE DE NAVEGAÇÃO
     */
    return MaterialApp(
      title: 'Projeto Aldo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      /// ROTAS PARA AS "ACTIVITIES"
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

/// CONSTANTES DAS ROTAS, PARA EVITAR ERROS DE DIGITAÇÃO EM OUTRAS PARTES DA
/// APLICAÇÃO
class Rotas {

  /// QUANDO COLOCA SOMENTE A "/", O FLUTTER ENTENDE QUE É A "ACTIVITY" INICIAL
  static const INICIO = '/';
  static const CALCULADORA = '/calculadora';
  static const NAVEGADOR = '/navegador';
  static const AGENDA_TELEFONICA = '/agenda-telefonica';
  static const EU_NO_MAPA = '/mapa';
}
