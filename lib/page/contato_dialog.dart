import 'package:flutter/material.dart';
import 'package:projeto_aldo/core/model/contato.dart';
import 'package:projeto_aldo/form/numero_telefone_text_editing_controller.dart';

class ContatoDialog extends StatefulWidget {
  final void Function(Contato) onConfirma;
  final Contato? contato;

  ContatoDialog({
    Key? key,
    required this.onConfirma,
    this.contato,
  }) : super(key: key);

  @override
  _ContatoDialogState createState() => _ContatoDialogState();
}

class _ContatoDialogState extends State<ContatoDialog> {
  late TextEditingController _nomeController = TextEditingController();
  late TextEditingController _telefoneController =
      NumeroTelefoneTextEditingController(
    numeroCaracteres: 11,
  );

  @override
  void initState() {
    super.initState();

    if (widget.contato != null) {
      _nomeController = TextEditingController(text: widget.contato?.nome);
      _telefoneController =
          NumeroTelefoneTextEditingController(text: widget.contato?.telefone, numeroCaracteres: 11);
    }
  }

  _novoContato() {
    var nome = _nomeController.text;
    var sobrenome = _telefoneController.text;

    if (nome.isNotEmpty && sobrenome.isNotEmpty) {
      widget.onConfirma(
        Contato(
          id: widget.contato != null ? widget.contato!.id : null,
          nome: nome,
          telefone: sobrenome,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Contato'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nome'),
                controller: _nomeController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Telefone'),
                controller: _telefoneController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('CANCELAR'),
                  ),
                  TextButton(onPressed: _novoContato, child: Text('CONFIRMAR'))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
