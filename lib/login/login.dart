import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 70,
            ),
            const FlutterLogo(
              size: 150,
            ),
            SizedBox(
              height: 70,
            ),
            Flexible(
                child: LoginButton(
                    color: Colors.deepPurple,
                    icon: FontAwesomeIcons.userNinja,
                    text: "continuer en tant qu'invite",
                    loginMethod: AuthService().anoLogin
                )
            ),
            Flexible(
                child: LoginButton(
                    color: Colors.blue,
                    icon: FontAwesomeIcons.google,
                    text: 'Continue comme tu veux',
                    loginMethod: AuthService().googleLogin,
                )
            ),
            Flexible(
              child: FutureBuilder<bool>(
                future: SignInWithApple.isAvailable(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data == true) {
                    return LoginButton(
                      color: Colors.grey,
                      icon: FontAwesomeIcons.apple,
                      text: 'connecte avec apple',
                      loginMethod: AuthService().signInWithApple,
                    );
                  }
                  return const SizedBox.shrink(); // Return an empty widget if not available
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;
  const LoginButton({super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.loginMethod}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        label: Text(text,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}


