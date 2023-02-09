import 'package:flutter/material.dart';

class PokeFavoriteScreen extends StatefulWidget {
  const PokeFavoriteScreen({super.key});

  @override
  State<PokeFavoriteScreen> createState() => _PokeFavoriteScreenState();
}

class _PokeFavoriteScreenState extends State<PokeFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Favorite Pokemons',
        ),
        toolbarHeight: 48,
        backgroundColor: const Color(0xFF1D1D1D),
      ),
      body: SafeArea(
        child: Container(
          child: const Text('Favorite screen'),
        ),
      ),
    );
  }
}
