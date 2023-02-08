import 'package:flutter/material.dart';
import 'package:poke_dictionary/model/pokemon.dart';
import 'package:poke_dictionary/utils/helpers.dart';

class PokemonSingle extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonSingle({super.key, required this.pokemon});

  @override
  State<PokemonSingle> createState() => _PokemonSingleState();
}

class _PokemonSingleState extends State<PokemonSingle> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
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
            Expanded(
              // padding: const EdgeInsets.symmetric(
              //   vertical: 4,
              //   horizontal: 8,
              // ),
              child: Text(
                '#${slice('000${widget.pokemon.id}', 4)}',
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Image.network(
              widget.pokemon.avatarUrl,
              width: 72,
              height: 72,
            ),
            Container(
              // width: double.infinity,
              height: 24,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: Color(0xFFF74CB48),
              ),
              child: Center(
                child: Text(
                  widget.pokemon.name,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFFF),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
