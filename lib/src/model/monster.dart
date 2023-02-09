import 'package:equatable/equatable.dart';

class Monster extends Equatable {
  final int id;
  final String name;
  final String url;

  const Monster({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Monster.fromJson(Map<String, dynamic> json) {
    return Monster(
      name: json['userId'],
      url: json['url'],
      id: json['id'],
    );
  }

  @override
  List<Object> get props => [id, name, url];
}
