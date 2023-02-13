import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dictionary/src/blocs/poke/poke_bloc.dart';
import 'package:poke_dictionary/src/model/pokemon/pokemon.model.dart';
import 'package:poke_dictionary/src/pages/pokemon/pokemon_single.dart';
import 'package:poke_dictionary/src/widgets/bottom_loader.dart';

class PokeListView extends StatefulWidget {
  const PokeListView({super.key});

  @override
  State<PokeListView> createState() => _PokeListViewState();
}

class _PokeListViewState extends State<PokeListView> {
  final String imageUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokeBloc, PokeState>(
      builder: (context, state) {
        switch (state.status) {
          case PokeStatus.failure:
            return const Center(child: Text('failed to fetch pokemons'));
          case PokeStatus.success:
            if (state.monsters.isEmpty) {
              return const Center(child: Text('no pokemons'));
            }
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              children: List.generate(
                state.hasReachedMax
                    ? state.monsters.length
                    : state.monsters.length + 1,
                (int index) {
                  String pokeIndex = (index + 1).toString();
                  if (index >= state.monsters.length) {
                    return const BottomLoader();
                  }
                  Pokemon poke = Pokemon(
                    name: state.monsters[index].name,
                    id: pokeIndex,
                    avatarUrl: '$imageUrl$pokeIndex.png',
                    url: state.monsters[index].url,
                  );
                  return PokemonSingle(pokemon: poke);
                },
              ),
            );
          case PokeStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
