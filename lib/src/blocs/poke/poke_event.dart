part of 'poke_bloc.dart';

abstract class PokeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PokeFetched extends PokeEvent {}
