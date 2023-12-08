import 'package:poke_app/src/shared/utils/HexToColor/color_by_string.dart';

class ColorByPokemonType {
  static backGroundColor({required String type}) {
    switch (type) {
      case 'grass':
        return HexToColor.toColor('8BBE8A');
      case 'fire':
        return HexToColor.toColor('FFA756');
      case 'water':
        return HexToColor.toColor('58ABF6');
      case 'poison':
        return HexToColor.toColor('9F6E97');
      case 'normal':
        return HexToColor.toColor('B5B9C4');
      case 'bug':
        return HexToColor.toColor('8BD674');
      case 'flying':
        return HexToColor.toColor('748FC9');
      case 'eletric':
        return HexToColor.toColor('F2CB55');
      case 'ground':
        return HexToColor.toColor('F78551');
      default:
        return HexToColor.toColor('9DA0AA');
    }
  }

  static boxColor({required String type}) {
    switch (type) {
      case 'grass':
        return HexToColor.toColor('62B957');
      case 'fire':
        return HexToColor.toColor('FD7D24');
      case 'water':
        return HexToColor.toColor('4A90DA');
      case 'poison':
        return HexToColor.toColor('A552CC');
      case 'normal':
        return HexToColor.toColor('9DA0AA');
      case 'bug':
        return HexToColor.toColor('8CB330');
      case 'flying':
        return HexToColor.toColor('748FC9');
      case 'eletric':
        return HexToColor.toColor('F2CB55');
      case 'ground':
        return HexToColor.toColor('F78551');
      default:
        return HexToColor.toColor('F78551');
    }
  }
}
