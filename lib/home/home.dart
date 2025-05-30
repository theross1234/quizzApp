import 'package:fireship/login/login.dart';
import 'package:fireship/services/auth.dart';
import 'package:fireship/topics/topics.dart';
import 'package:flutter/material.dart';

import '../shared/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()
            );
          }else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }else if (snapshot.hasData) {
            return const TopicsScreen();
          }else {
            return LoginScreen();
          }
        }
    );
  }
}
