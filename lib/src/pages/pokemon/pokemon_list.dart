import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dictionary/src/blocs/poke/poke_bloc.dart';

import 'package:poke_dictionary/src/gen/assets.gen.dart';
import 'package:poke_dictionary/src/model/monster.dart';
import 'package:poke_dictionary/src/widgets/poke_list_view.dart';

class PokeListScreen extends StatefulWidget {
  const PokeListScreen({super.key});

  @override
  State<PokeListScreen> createState() => _PokeListScreenState();
}

class _PokeListScreenState extends State<PokeListScreen> {
  late Future<List<Monster>> pokemonList;
  final String imageUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List all',
        ),
        toolbarHeight: 48,
        backgroundColor: const Color(0xFF1D1D1D),
      ),
      body: BlocProvider(
        create: (_) => PokeBloc(dio: Dio())..add(PokeFetched()),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 50,
              left: 16,
              right: 16,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 640),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                        child: Row(
                          children: [
                            Assets.icons.pokeballIcon.svg(
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Pokedex',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const PokeListView(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      print('load more...');
      context.read<PokeBloc>().add(PokeFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
