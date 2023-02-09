class Pokemon {
  String id;
  String name;
  String avatarUrl;
  String detailUrl;
  List<String> type;

  Pokemon({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.detailUrl,
    required this.type,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      avatarUrl: json['ThumbnailImage'],
      detailUrl: 'https://www.pokemon.com${json['detailPageURL']}',
      type: json['type'],
    );
  }
}
