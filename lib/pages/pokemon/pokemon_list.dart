import 'package:flutter/material.dart';
import 'package:poke_dictionary/pages/pokemon/pokemon_single.dart';
import 'package:poke_dictionary/service/pokemon.service.dart';

import '../../model/pokekalos.dart';

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  late Future<List<Pokemon>> pokemonList;
  final String imageUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';

  @override
  void initState() {
    super.initState();
    pokemonList = getPokeList();
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
      child: FutureBuilder<List<Pokemon>>(
        future: getPokeList(),
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
                  Pokemon poke = Pokemon(
                    name: snapshot.data![index].name,
                    id: snapshot.data![index].id,
                    avatarUrl: snapshot.data![index].avatarUrl,
                    detailUrl: snapshot.data![index].detailUrl,
                    type: snapshot.data![index].type,
                  );
                  print('test 123');
                  print(poke);
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
