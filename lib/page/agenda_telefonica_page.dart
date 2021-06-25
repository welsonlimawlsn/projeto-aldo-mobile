import 'package:flutter/material.dart';
import 'package:projeto_aldo/core/agenda_service.dart';
import 'package:projeto_aldo/core/model/contato.dart';
import 'package:projeto_aldo/page/contato_dialog.dart';

class AgendaTelefonicaPage extends StatefulWidget {
  AgendaTelefonicaPage({Key? key}) : super(key: key);

  @override
  _AgendaTelefonicaPageState createState() => _AgendaTelefonicaPageState();
}

class _AgendaTelefonicaPageState extends State<AgendaTelefonicaPage> {
  final _agendaService = AgendaService.instance;

  List<Contato> _contatos = [];

  @override
  void initState() {
    super.initState();
    _atualizaListaDeContatos();
  }

  _novoContato(Contato contato) {
    _agendaService.novoContato(contato).whenComplete(_atualizaListaDeContatos);
  }

  _abreDialogContato(void Function(Contato) onConfirma, Contato? contato) {
    showDialog(
      context: context,
      builder: (context) => ContatoDialog(
        onConfirma: onConfirma,
        contato: contato,
      ),
    );
  }

  _removeContato(Contato contato) {
    _agendaService
        .removeContato(contato)
        .whenComplete(_atualizaListaDeContatos);
  }

  _alteraContato(Contato contato) {
    _agendaService
        .alteraContato(contato)
        .whenComplete(_atualizaListaDeContatos);
  }

  _atualizaListaDeContatos() {
    _agendaService.listaContatos().then((value) {
      setState(() {
        value.sort((c1, c2) => c1.nome.compareTo(c2.nome));
        _contatos = value;
      });
    });
  }

  _mostraOpcoes(Contato contato) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 110,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Exluir'),
                onTap: () {
                  _removeContato(contato);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.update),
                title: Text('Alterar'),
                onTap: () {
                  Navigator.pop(context);
                  _abreDialogContato(_alteraContato, contato);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda telefônica'),
        actions: [
          IconButton(
            onPressed: () => _abreDialogContato(_novoContato, null),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final contato = _contatos[index];
          return ListTile(
            title: Text(contato.nome),
            subtitle: Text(contato.telefone),
            trailing: IconButton(
              onPressed: () => _mostraOpcoes(contato),
              icon: Icon(Icons.more_vert),
            ),
            leading: CircleAvatar(
              child: Text(contato.nome.substring(0, 1).toUpperCase()),
            ),
          );
        },
        itemCount: _contatos.length,
      ),
    );
  }
}
