import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:poke_dictionary/src/model/pokemon/monster.model.dart';
import 'package:poke_dictionary/src/model/pokemon/pokedetail.model.dart';

Future<List<Monster>> fetchPokeList() async {
  final response =
      await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=22');
  List<dynamic> results = [];
  if (response.statusCode == 200) {
    results = json.decode(response.toString())['results'];
    List<Monster> pokeList = [];
    for (int index = 0; index < results.length; index++) {
      pokeList.add(
        Monster(
          name: results[index]['name'],
          url: results[index]['url'],
          id: index,
        ),
      );
    }
    return pokeList;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<PokemonDetail> getPokemonDetailByName(String name) async {
  final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$name');
  PokemonDetail result =
      PokemonDetail.fromJson(json.decode(response.toString()));
  return result;
}
