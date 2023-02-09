import 'package:flutter/material.dart';
import 'package:poke_dictionary/src/gen/assets.gen.dart';
import 'package:poke_dictionary/src/pages/login/google_sigin_button.dart';
import 'package:poke_dictionary/src/utils/authentication.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(183, 185, 208, 0.55),
        toolbarHeight: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(183, 185, 208, 0.55),
              Color.fromRGBO(116, 203, 72, 1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 490,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.orange,
                image: DecorationImage(
                  image: Assets.images.pokeballBg.provider(),
                  fit: BoxFit.fill,
                ),
              ),
              child: (Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 105,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: Assets.images.pokemonLogo.image(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Assets.images.dictionaryLogoPng.image(),
                  )
                ],
              )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 22,
              ),
              child: Column(
                children: [
                  FutureBuilder(
                    future: Authentication.initializeFirebase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text(
                          'Error initializing Firebase',
                          style: TextStyle(color: Colors.white),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return const GoogleSignInButton();
                      }
                      return const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1877F2),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: Assets.icons.facebookIcon.svg(
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        // login with google
                      },
                      label: const Text(
                        'Sign in with Facebook',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 60,
                  //   child: ElevatedButton.icon(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xFFFFFFFF),
                  //       minimumSize: const Size.fromHeight(50),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //     icon: Assets.icons.googleIcon.svg(
                  //       width: 24,
                  //       height: 24,
                  //     ),
                  //     onPressed: () {
                  //       // login with google
                  //     },
                  //     label: const Text(
                  //       'Sign in with Google',
                  //       textAlign: TextAlign.right,
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w500,
                  //         color: Color.fromRGBO(0, 0, 0, 0.54),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
