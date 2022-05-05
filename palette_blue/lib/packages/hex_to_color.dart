import 'dart:ui';


class HexToColor extends Color {
  static _hexToColor(String code) {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }

  HexToColor(final String code) : super(_hexToColor(code));
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension CustomString on String {
  String toHex() {
    return '${this[0] == "#" ? this : '#$this'}';
  }

  String toNonHex() {
    return '${this[0] == "#" ? this.substring(1) : this}';
  }
}
