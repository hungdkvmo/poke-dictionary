import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poke_dictionary/gen/assets.gen.dart';
import 'package:poke_dictionary/utils/authentication.dart';
import 'package:poke_dictionary/widgets/user/user_info.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  GoogleSignInButtonState createState() {
    return GoogleSignInButtonState();
  }
}

class GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFFFFF),
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          icon: Assets.icons.googleIcon.svg(
            width: 24,
            height: 24,
          ),
          onPressed: () async {
            // login with google
            setState(() {
              _isSigningIn = true;
            });
            User? user =
                await Authentication.signInWithGoogle(context: context);
            print('User: {$user.toString()}');
            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreen(
                    user: user,
                  ),
                ),
              );
            }

            setState(() {
              _isSigningIn = false;
            });
          },
          label: const Text(
            'Sign in with Google',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(0, 0, 0, 0.54),
            ),
          ),
        ),
      ),
    );
  }
}
