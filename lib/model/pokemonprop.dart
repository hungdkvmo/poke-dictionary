class PokemonStat {
  int baseStat;
  String name;

  PokemonStat({
    required this.baseStat,
    required this.name,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      name: json['stat']['name'],
      baseStat: json['base_stat'],
    );
  }
}

class PokeType {
  String name;
  String url;
  PokeType({
    required this.name,
    required this.url,
  });
}

class PokemonType {
  int slot;
  String name;
  PokeType type;

  PokemonType({
    required this.slot,
    required this.name,
    required this.type,
  });
  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      slot: json['slot'],
      name: json['name'],
      type: json['name'],
    );
  }
}
