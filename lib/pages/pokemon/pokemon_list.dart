import 'package:flutter/material.dart';
import 'package:poke_dictionary/pages/pokemon/pokemon_single.dart';

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const PokemonSingle(),
    );
  }
}
