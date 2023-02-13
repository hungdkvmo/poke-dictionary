part of 'poke_bloc.dart';

enum PokeStatus { initial, success, failure }

class PokeState extends Equatable {
  PokeState({
    this.status = PokeStatus.initial,
    this.monsters = const <Monster>[],
    this.hasReachedMax = false,
  });

  PokeStatus status;
  final List<Monster> monsters;
  final bool hasReachedMax;

  PokeState copyWith({
    PokeStatus? status,
    List<Monster>? monsters,
    bool? hasReachedMax,
  }) {
    return PokeState(
      status: status ?? this.status,
      monsters: monsters ?? this.monsters,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PokeState { status: $status, hasReachedMax: $hasReachedMax, monsters: ${monsters.length} }''';
  }

  @override
  List<Object> get props => [status, monsters, hasReachedMax];
}
