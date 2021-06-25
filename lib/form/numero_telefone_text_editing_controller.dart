import 'package:projeto_aldo/form/abstract_caracteres_selecionados_text_editing_controller.dart';

class NumeroTelefoneTextEditingController
    extends AbtractCaracteresSelecionadosTextEditingController {
  int? numeroCaracteres;

  NumeroTelefoneTextEditingController({
    this.numeroCaracteres,
    String? text,
  }) : super(numeroCaracteres: numeroCaracteres, text: text);

  @override
  String get validCharacters => '0123456789';
}
