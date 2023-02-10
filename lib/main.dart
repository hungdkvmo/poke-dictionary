import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dictionary/simple_bloc_observer.dart';

import 'package:flutter/material.dart';
import 'package:poke_dictionary/src/pages/home.dart';
import 'package:poke_dictionary/src/pages/login/login_screen.dart';
import 'package:poke_dictionary/src/pages/pokemon/pokemon_detail.dart';
import 'package:poke_dictionary/src/pages/pokemon/pokemon_favorite.dart';
import 'package:poke_dictionary/src/pages/pokemon/pokemon_screen.dart';
// import 'package:poke_dictionary/widgets/user/user_info.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Dictionary',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      // home: const Scaffold(
      //   body: Home(),
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/home': (context) => const Home(),
        '/login': (context) => const LoginScreen(),
        '/pokemon_all': (context) => const PokeListScreen(),
        '/pokemon_favorite': (context) => const PokeFavoriteScreen(),
        '/pokemon_detail': (context) => const PokemonDetailScreen(),
        // '/user_infor': (context) => const UserInfoScreen(),
      },
    );
  }
}
