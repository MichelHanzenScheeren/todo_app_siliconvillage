import 'package:todo_app_siliconvillage/domain/models/text_constants.dart';

class Text {
  late final String value;

  Text(String? text) {
    value = _processText(text ?? '');
  }

  String _processText(String text) {
    List<String> stringNumbers = getNumbers(text);
    List<String> numbersInWords = getWordsFromNumbers(stringNumbers);
    for (var i = 0; i < stringNumbers.length; i++) {
      text = text.replaceFirst(stringNumbers[i], numbersInWords[i]);
    }
    return text;
  }

  List<String> getNumbers(String text) {
    List<String> splitText = text.replaceAll('\n', '').split(" ");
    List<String> filteredText = [];
    final myRegex = RegExp(r'^[0-9]+$');
    for (var element in splitText) {
      if (myRegex.hasMatch(element)) filteredText.add(element);
    }
    return filteredText;
  }

  List<String> getWordsFromNumbers(List<String> stringNumbers) {
    List<String> numberNames = [];
    for (var element in stringNumbers) {
      List<String> substrings = getSubstrings(element);
      String numberInWord = getNameRecursive(substrings, 0);
      numberNames.add(numberInWord);
    }
    return numberNames;
  }

  List<String> getSubstrings(String value) {
    final reverse = value.split('').reversed.join();
    List<String> elementParts = [];
    for (int i = 0; i < reverse.length; i++) {
      if (i % 3 == 2) {
        final tempString = reverse.substring(i - 2, i + 1);
        elementParts.insert(0, tempString.split('').reversed.join());
      }
    }
    if (reverse.length % 3 != 0) {
      int init = reverse.length - (reverse.length % 3);
      String aux = reverse.substring(init, reverse.length);
      elementParts.insert(0, aux.split('').reversed.join());
    }
    return elementParts;
  }

  String getNameRecursive(List<String> substrings, int index) {
    String substring = substrings[index];
    int level = substrings.length - index;

    switch (level) {
      case 1:
        return baseGroupName(substring, needRemoveLeftZeros: index != 0);
      case 2:
      case 3:
      case 4:
      case 5:
        String current = singOrPluralBigNumbers(substring, level);
        String next = getNameRecursive(substrings, index + 1);
        String connector = next != '' && current != '' ? ' e ' : '';
        return current + connector + next;
      default:
        return 'muito e ${getNameRecursive(substrings, index + 1)}';
    }
  }

  String baseGroupName(String substring, {needRemoveLeftZeros = true}) {
    if (needRemoveLeftZeros) substring = removeLeftZeros(substring);
    if (substring == '') return '';
    if (substring.length == 3) return hundredsNames(substring);
    if (substring.length == 2) return dozensNames(substring);
    return unitNames(substring);
  }

  String removeLeftZeros(String substring) {
    while (substring.isNotEmpty && substring[0] == '0') {
      final aux = substring.split('');
      aux.removeAt(0);
      substring = aux.join('');
    }
    return substring;
  }

  String hundredsNames(String substring) {
    if (substring == '100') return 'cem';
    String current = TextConstants.hundreds[int.parse(substring[0])];
    String next = dozensNames(substring.substring(1));
    return current + (next != '' && current != '' ? ' e ' : '') + next;
  }

  String dozensNames(String substring) {
    if (substring[0] == '1') {
      return TextConstants.firstTen[int.parse(substring[1])];
    }
    String current = TextConstants.dozens[int.parse(substring[0])];
    String next = unitNames(substring.substring(1), returnZero: false);
    return current + (next != '' && current != '' ? ' e ' : '') + next;
  }

  String unitNames(String value, {returnZero = true}) {
    if (value == '0' && returnZero) return 'zero';
    return TextConstants.units[int.parse(value)];
  }

  String singOrPluralBigNumbers(String substring, int level) {
    level = level - 2;
    if (substring == '1') {
      String stringOne = level != 0 ? 'um ' : '';
      return stringOne + TextConstants.singularBigNumbers[level];
    }
    String base = baseGroupName(substring);
    String sep = base != '' ? ' ${TextConstants.pluralBigNumbers[level]}' : '';
    return base + sep;
  }
}
