import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
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
    LocalJsonLocalization.delegate.directories = ['lib/src/i18n'];
    return MaterialApp(
      title: 'Pokemon Dictionary',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('vi', 'VI'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        // define vi as default when de language code is 'vi'
        if (locale?.languageCode == 'vi') {
          return const Locale('vi', 'VI');
        }

        // default language
        // return const Locale('en', 'US');
        return const Locale('vi', 'VI');
      },
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
