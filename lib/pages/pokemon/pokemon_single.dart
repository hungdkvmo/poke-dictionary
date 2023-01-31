import 'package:flutter/material.dart';
import 'package:poke_dictionary/model/pokemon.dart';

class PokemonSingle extends StatefulWidget {
  const PokemonSingle({super.key});

  @override
  State<PokemonSingle> createState() => _PokemonSingleState();
}

class _PokemonSingleState extends State<PokemonSingle> {
  late Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF74CB48),
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Text(pokemon.id),
          ),
          Image.network(pokemon.avatarUrl),
          Container(
            width: double.infinity,
            height: 24,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(pokemon.name),
            ),
          )
        ],
      ),
    );
  }
}
