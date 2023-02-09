import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_infinite_list/posts/posts.dart';
import 'package:poke_dictionary/src/model/monster.dart';
import 'package:stream_transform/stream_transform.dart';

part 'poke_event.dart';
part 'poke_state.dart';

const _postLimit = 15;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  PokeBloc({required this.dio}) : super(const PokeState()) {
    on<PokeFetched>(
      _onPokeFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final Dio dio;

  Future<void> _onPokeFetched(
    PokeFetched event,
    Emitter<PokeState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PokeStatus.initial) {
        final monsters = await fetchPokeList();
        return emit(
          state.copyWith(
            status: PokeStatus.success,
            monsters: monsters,
            hasReachedMax: false,
          ),
        );
      }
      final monsters = await fetchPokeList(state.monsters.length);
      monsters.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PokeStatus.success,
                monsters: List.of(state.monsters)..addAll(monsters),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PokeStatus.failure));
    }
  }

  Future<List<Monster>> fetchPokeList([int startIndex = 0]) async {
    final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon?limit=$_postLimit?offset=$startIndex');
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

      // final body = json.decode(response.body) as List;
      // return body.map((dynamic json) {
      //   final map = json as Map<String, dynamic>;
      //   return Post(
      //     id: map['id'] as int,
      //     title: map['title'] as String,
      //     body: map['body'] as String,
      //   );
      // }).toList();
    }
    throw Exception('error fetching posts');
  }
}
