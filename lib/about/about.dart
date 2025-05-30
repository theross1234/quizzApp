import 'package:flutter/material.dart';

import '../shared/bottom_nav.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(),
      body: const Center(
        child: Text('about Page'),
      ),
    );
  }
}
