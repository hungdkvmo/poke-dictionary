import 'package:flutter/material.dart';
import 'package:poke_dictionary/model/pokedetail.dart';
import 'package:poke_dictionary/model/pokemon.dart';
import 'package:poke_dictionary/service/pokemon.service.dart';
import 'package:poke_dictionary/utils/helpers.dart';

class PokemonSingle extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonSingle({super.key, required this.pokemon});

  @override
  State<PokemonSingle> createState() => _PokemonSingleState();
}

class _PokemonSingleState extends State<PokemonSingle> {
  PokemonDetail pokemonDetail = PokemonDetail(
      id: 0,
      name: 'name',
      url: 'url',
      avatarUrl: 'avatarUrl',
      stats: {},
      types: []);

  @override
  void initState() {
    super.initState();
    getPokemonDetailByName(widget.pokemon.id)
        .then((value) => {
              setState(() {
                pokemonDetail = value;
              }),
            })
        .catchError(
          (error) => {
            print(error),
          },
        );
  }

  Color setPokeColorByType(List<String> types) {
    Color result = Color(getColorPokemon('unknown'));
    if (types.isNotEmpty) {
      String primaryType = types[0];
      result = Color(getColorPokemon(primaryType));
    }
    return result;
  }

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
            // color: const Color(0xFF74CB48),
            color: setPokeColorByType(pokemonDetail.types),
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
                '#${slice('000${pokemonDetail.id}', 4)}',
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                // color: Color(0xFFF74CB48),
                color: setPokeColorByType(pokemonDetail.types),
              ),
              child: Center(
                child: Text(
                  pokemonDetail.name,
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
