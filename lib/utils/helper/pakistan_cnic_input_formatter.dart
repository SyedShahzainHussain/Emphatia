import 'package:flutter/services.dart';

class PakistanCnicInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;

    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength >= 6) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 5)}-');
      if (newValue.selection.end >= 5) selectionIndex += 1;
    }
    if (newTextLength >= 13) {
      newText.write('${newValue.text.substring(5, usedSubstringIndex = 12)}-');
      if (newValue.selection.end >= 12) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
