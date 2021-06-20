import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aldo/component/funcionalidade_button.dart';
import 'package:projeto_aldo/main.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto'),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        children: [
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
