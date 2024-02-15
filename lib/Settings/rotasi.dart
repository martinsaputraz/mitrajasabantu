import 'package:jasa_bantu/Settings/constant.dart';

Constant constant = Constant();

class Rotasi {
  static String rotateText(String text, int shift) {
    String rotatedText = '';

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (constant.ROT_KEY.contains(char)) {
        int rotatedIndex = (constant.ROT_KEY.indexOf(char) + shift) %
            constant.ROT_KEY.length;
        rotatedText += constant.ROT_KEY[rotatedIndex];
      } else {
        rotatedText += char;
      }
    }
    return rotatedText;
  }

  static String reverseRotateText(String text, int shift) {
    // Reverse rotation is equivalent to rotating in the opposite direction
    return rotateText(text, -shift);
  }
}
