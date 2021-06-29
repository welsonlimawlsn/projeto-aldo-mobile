import 'package:flutter/cupertino.dart';

abstract class AbtractCaracteresSelecionadosTextEditingController
    extends TextEditingController {
  int? numeroCaracteres;
  String _textoAntigo = '';

  /// CONSTRUTOR
  AbtractCaracteresSelecionadosTextEditingController({
    this.numeroCaracteres,
    String? text,
  }) : super(text: text) {
    addListener(_changeListener);
  }

  /// FICA OUVINDO AS ALTERAÇÕES DO TEXTO DIGITADO NO CAMPO
  void _changeListener() {
    if (text.isNotEmpty) {
      var newText =
          text.characters/// SEPARA OS CARACTERES EM UMA LISTA
              .where(_isValidCharacter)/// SELECIONA OS CARACTERES VALIDOS
              .fold('', _concatCharacters);/// JUNTA OS CARACTERES NOVAMENTE

      var estaNoLimiteDeCaracteres =
          numeroCaracteres == null || newText.length <= (numeroCaracteres ?? 0);

      if (estaNoLimiteDeCaracteres) {
        _setValue(newText);
        _textoAntigo = newText;
      } else {
        _setValue(_textoAntigo);
      }
    }
  }

  void _setValue(String text) {
    value = value.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange.empty
    );
  }

  String _concatCharacters(String value, String element) {
    if (element == '.' && value.contains('.')) {
      return value;
    }
    return value + element;
  }

  bool _isValidCharacter(String character) {
    return validCharacters.contains(character);
  }

  String get validCharacters;
}
