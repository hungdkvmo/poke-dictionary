class PokemonDetail {
  int id;
  String name;
  String url;
  String avatarUrl;
  Map stats;
  List<String> types;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.url,
    required this.avatarUrl,
    required this.stats,
    required this.types,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    List<String> typesMap = [];
    Map statsMap = {};
    json['types'].forEach(
      (dynamic item) => {
        typesMap.add(item['type']['name']),
      },
    );
    json['stats'].forEach(
      (dynamic item) => {
        statsMap[item['stat']['name']] = item['base_stat'],
      },
    );
    return PokemonDetail(
      id: json['id'],
      name: json['name'],
      url: json['url'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      stats: statsMap,
      types: typesMap,
    );
  }
}
