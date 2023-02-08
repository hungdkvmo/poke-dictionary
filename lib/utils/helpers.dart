import 'package:poke_dictionary/utils/constants.dart';

String slice(String str, int len) {
  if (str.isEmpty) {
    str = '';
  }
  if (len < 0 || len.isNaN) {
    len = 0;
  }
  int strLen = str.length;
  return str.substring(strLen - len, strLen);
}

int getColorPokemon(String type) {
  int result = PokeType.unknownColor;
  switch (type) {
    case PokeType.normal:
      result = PokeType.normalColor;
      break;
    case PokeType.fighting:
      result = PokeType.fightingColor;
      break;
    case PokeType.flying:
      result = PokeType.flyingColor;
      break;
    case PokeType.poison:
      result = PokeType.poisonColor;
      break;
    case PokeType.ground:
      result = PokeType.groundColor;
      break;
    case PokeType.rock:
      result = PokeType.rockColor;
      break;
    case PokeType.bug:
      result = PokeType.bugColor;
      break;
    case PokeType.steel:
      result = PokeType.steelColor;
      break;
    case PokeType.fire:
      result = PokeType.fireColor;
      break;
    case PokeType.water:
      result = PokeType.waterColor;
      break;
    case PokeType.grass:
      result = PokeType.grassColor;
      break;
    case PokeType.electric:
      result = PokeType.electricColor;
      break;
    case PokeType.psychic:
      result = PokeType.psychicColor;
      break;
    case PokeType.ice:
      result = PokeType.iceColor;
      break;
    case PokeType.dragon:
      result = PokeType.dragonColor;
      break;
    case PokeType.dark:
      result = PokeType.darkColor;
      break;
    case PokeType.fairy:
      result = PokeType.fairyColor;
      break;
    case PokeType.shadow:
      result = PokeType.shadowColor;
      break;
  }
  return result;
}
