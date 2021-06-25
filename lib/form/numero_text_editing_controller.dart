import 'package:flutter/material.dart';

class NumeroTextEditingController extends TextEditingController {
  static const String validCharacters = '0123456789.';

  NumeroTextEditingController() {
    addListener(_changeListener);
  }

  void _changeListener() {
    if (text.isNotEmpty) {
      var newText =
          text.characters.where(_isValidCharacter).fold('', _concatCharacters);

      value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(
          offset: newText.length,
        ),
      );
    }
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
}
