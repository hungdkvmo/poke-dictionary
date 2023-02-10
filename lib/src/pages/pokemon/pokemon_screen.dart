import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dictionary/src/blocs/poke/poke_bloc.dart';
import 'package:poke_dictionary/src/pages/pokemon/pokemon_list.dart';

class PokeListScreen extends StatelessWidget {
  const PokeListScreen({super.key});

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
        child: const PokemonList(),
      ),
    );
  }
}
