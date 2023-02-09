import 'package:flutter/material.dart';
import 'package:poke_dictionary/src/model/pokedetail.dart';
import 'package:poke_dictionary/src/model/pokemon.dart';
import 'package:poke_dictionary/src/pages/pokemon/pokemon_detail.dart';
import 'package:poke_dictionary/src/service/pokemon.service.dart';
import 'package:poke_dictionary/src/utils/helpers.dart';

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
    types: [],
  );
  Color _mainColor = Color(getColorPokemon(''));

  @override
  void initState() {
    super.initState();
    getPokemonDetailByName(widget.pokemon.id)
        .then((value) => {
              setState(() {
                pokemonDetail = value;
                _mainColor = setPokeColorByType(pokemonDetail.types);
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
        child: GestureDetector(
          onTap: () {
            PokemonDetail pokeInfo = pokemonDetail;
            pokeInfo.avatarUrl = widget.pokemon.avatarUrl;
            Navigator.pushNamed(
              context,
              PokemonDetailScreen.routeName,
              arguments: ScreenArguments(pokeInfo),
            );
          },
          child: Container(
            width: 104,
            height: 112,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _mainColor,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 4,
                    left: 8,
                    right: 8,
                  ),
                  alignment: Alignment.centerRight,
                  height: 20,
                  child: Text(
                    '#${slice('000${pokemonDetail.id}', 4)}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: _mainColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Image.network(
                    widget.pokemon.avatarUrl,
                    width: 72,
                    height: 72,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: _mainColor,
                  ),
                  child: Center(
                    child: Text(
                      pokemonDetail.name.toCapitalized(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
