import 'package:flutter/material.dart';
import 'package:poke_dictionary/src/gen/assets.gen.dart';
import 'package:poke_dictionary/src/pages/pokemon/pokemon_favorite.dart';
import 'package:poke_dictionary/src/pages/pokemon/pokemon_list.dart';
// import 'package:poke_dictionary/src/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 1;
  final List<Widget> screens = [
    const PokeFavoriteScreen(),
    const PokeListScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen = screens[currentTab];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF1D1D1D),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: GestureDetector(
        child: Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(76),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 4,
                blurRadius: 4,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Assets.icons.pokeballIcon.svg(
              width: 60,
              height: 60,
            ),
          ),
        ),
        onTap: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1D1D1D),
        child: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Color(0xFF1D1D1D),
          ),
          // bottom: false,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    backgroundColor: const Color(0xFF1D1D1D),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  onPressed: () => {
                    setState(
                      () {
                        currentScreen = const PokeFavoriteScreen();
                        currentTab = 0;
                      },
                    )
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 24,
                        color: currentTab == 0 ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Favorite',
                        style: TextStyle(
                          color: currentTab == 0 ? Colors.white : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 130,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                    backgroundColor: const Color(0xFF1D1D1D),
                  ),
                  onPressed: () => {
                    setState(
                      () {
                        currentScreen = const PokeListScreen();
                        currentTab = 1;
                      },
                    )
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.grid_view,
                        size: 24,
                        color: currentTab == 1 ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'List all',
                        style: TextStyle(
                          color: currentTab == 1 ? Colors.white : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      // body: Navigator(
      //   onGenerateRoute: (settings) {
      //     Widget page = screens[currentTab];
      //     if (settings.name == RouterName.pokemonFavorite) {page = const PokeFavoriteScreen();}
      //     else if (settings.name == RouterName.pokemonList) {page = const PokeListScreen();}
      //     else if (settings.name == RouterName.pokemonDetail) {page = const PokemonDetail();}
      //     return MaterialPageRoute(builder: (_) => page);
      //   },
      // ),
    );
  }
}
