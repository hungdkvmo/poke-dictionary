import 'package:flutter/material.dart';
import 'package:poke_dictionary/src/model/pokemon/pokedetail.model.dart';
import 'package:poke_dictionary/src/utils/helpers.dart';

class ScreenArguments {
  final PokemonDetail detail;

  ScreenArguments(this.detail);
}

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key});

  static const routeName = '/pokemon_detail';

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    Color mainColor = setPokeColorByType(args.detail.types);

    return Scaffold(
      appBar: AppBar(
        title: Text(args.detail.name.toCapitalized()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromRGBO(255, 255, 255, 0.6)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 48,
        centerTitle: false,
        backgroundColor: mainColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(4),
        // decoration: BoxDecoration(
        //   color: _mainColor,
        //   // borderRadius: BorderRadius.circular(12),
        // ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                  args.detail.avatarUrl,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < args.detail.types.length; i++) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    constraints: const BoxConstraints(
                      minWidth: 54,
                    ),
                    height: 22,
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Color(getColorPokemon(args.detail.types[i])),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      args.detail.types[i],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Base Stats',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        'HP',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          slice('0${args.detail.stats['hp'].toString()}', 3),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 230,
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                          ),
                        ),
                        SizedBox(
                          width: args.detail.stats['hp'].toDouble(),
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: mainColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        'ATK',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          slice(
                              '0${args.detail.stats['attack'].toString()}', 3),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 230,
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                          ),
                        ),
                        SizedBox(
                          width: args.detail.stats['attack'].toDouble(),
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: mainColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        'DEF',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          slice(
                              '0${args.detail.stats['defense'].toString()}', 3),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 230,
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                          ),
                        ),
                        SizedBox(
                          width: args.detail.stats['defense'].toDouble(),
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: mainColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        'SATK',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          slice(
                              '0${args.detail.stats['special-attack'].toString()}',
                              3),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 230,
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                          ),
                        ),
                        SizedBox(
                          width: args.detail.stats['special-attack'].toDouble(),
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: mainColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        'SDEF',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          slice(
                              '0${args.detail.stats['special-defense'].toString()}',
                              3),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 230,
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                          ),
                        ),
                        SizedBox(
                          width:
                              args.detail.stats['special-defense'].toDouble(),
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: mainColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        'SPD',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          slice('0${args.detail.stats['speed'].toString()}', 3),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: 230,
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                          ),
                        ),
                        SizedBox(
                          width: args.detail.stats['speed'].toDouble(),
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: mainColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
