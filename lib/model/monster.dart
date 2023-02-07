class Monster {
  final String name;
  final String url;
  final int id;
  const Monster({
    required this.name,
    required this.url,
    required this.id,
  });

  factory Monster.fromJson(Map<String, dynamic> json, id) {
    return Monster(
      name: json['userId'],
      url: json['url'],
      id: id,
    );
  }
}
