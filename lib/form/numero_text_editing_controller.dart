import 'package:projeto_aldo/form/abstract_caracteres_selecionados_text_editing_controller.dart';

class NumeroTextEditingController
    extends AbtractCaracteresSelecionadosTextEditingController {
  @override
  String get validCharacters => '0123456789.';
}
