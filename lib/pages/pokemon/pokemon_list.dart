import 'package:flutter/material.dart';
import 'package:poke_dictionary/model/monster.dart';
import 'package:poke_dictionary/model/pokemon.dart';
import 'package:poke_dictionary/pages/pokemon/pokemon_single.dart';
import 'package:poke_dictionary/service/pokemon.service.dart';

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  late Future<List<Monster>> pokemonList;
  final String imageUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';

  @override
  void initState() {
    super.initState();
    pokemonList = fetchPokeList();
  }

  // pokemon image: https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png
  // https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png
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
      child: FutureBuilder<List<Monster>>(
        future: pokemonList,
        builder: (context, snapshot) {
          return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1,
            children: List.generate(
              snapshot.data?.length ?? 0,
              (index) {
                if (snapshot.hasError) {
                  return const Text(
                    'Error fetching data',
                    style: TextStyle(color: Colors.white),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  String pokeIndex = (index + 1).toString();
                  Pokemon poke = Pokemon(
                    name: snapshot.data![index].name,
                    id: pokeIndex,
                    avatarUrl: '$imageUrl$pokeIndex.png',
                    url: snapshot.data![index].url,
                  );
                  return PokemonSingle(pokemon: poke);
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.orange,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
