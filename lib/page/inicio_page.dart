import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aldo/component/funcionalidade_button.dart';
import 'package:projeto_aldo/main.dart';

/// WIDGET DA PAGINA INICIAL CONTENDO OS QUATRO BOTÕES PARA NAVEGAR ENTRE AS
/// FUNCIONALIDADES
class InicioPage extends StatelessWidget {
  /// METODO build
  @override
  Widget build(BuildContext context) {

    /// ESTÁ RETORNANDO UM Scaffold
    ///
    /// ELE JÁ CONTEM A ESTRUTURA BASICA DE UMA ACTIVITY DO ANDROID, DANDO SUPORTE
    /// PARA A CONSTRUÇÃO DA APPBAR (BARRA SUPERIOR), DRAWER (MENU LATERAL),
    /// BOTÕES FLUTUANTES ETC.
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto'),
      ),
      /// GridView ORGANIZA OS ELEMENTOS EM FORMA DE GRADE, POSICIONANDO OS
      /// ELEMENTOS UM AO LADO DO OUTRO E ABAIXO, QUANDO NÃO HÁ LARGURA
      /// SUFICIENTE, TAMBEM CRIA SCROLL NA TELA QUANDO NÃO HÁ ALTURA SUFICIENTE
      /// PARA TODOS OS ELEMENTOS
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2, /// DEFINE O NUMERO DE ELEMENTOS QUE FICARA LADO A LADO. NO CASO FIRA 2 ELEMENTOS
          childAspectRatio: 1, /// DEFINE A PROPORÇÃO DE LARGURA X ALTURA. NO CASO VAI FORMAR UM QUADRADO
          crossAxisSpacing: 10, /// DEFINE ESPAÇAMENTO ENTRE ELES
          mainAxisSpacing: 10, /// DEFINE ESPAÇAMENTO ENTRE ELES
        ),
        children: [

          /// FuncionalidadeButton BOTÃO QUE RECEBE UM NOME, UMA ROTA E UM ICONE
          FuncionalidadeButton(
            nome: 'Calculadora',
            rota: Rotas.CALCULADORA,
            icone: Icons.calculate,
          ),
          FuncionalidadeButton(
            nome: 'Navegador',
            rota: Rotas.NAVEGADOR,
            icone: Icons.wifi,
          ),
          FuncionalidadeButton(
            nome: 'Agenda telefônica',
            rota: Rotas.AGENDA_TELEFONICA,
            icone: Icons.contacts,
          ),
          FuncionalidadeButton(
            nome: 'Eu no mapa',
            rota: Rotas.EU_NO_MAPA,
            icone: Icons.map,
          ),
        ],
      ),
    );
  }
}
