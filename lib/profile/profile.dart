import 'package:fireship/services/models.dart';
import 'package:fireship/shared/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../shared/loader.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;
    if (user != null){
      return Scaffold(
        //bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(user.displayName ?? 'Guest'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          user.photoURL ?? 'https://www.gravatar.com/avatar/placeholder')
                  ),
                ),
              ),
              Text(
                user.email ?? '',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              Text('${report.total}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text('Quizzes Completed',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              ElevatedButton(
                child: Text('logout'),
                  onPressed: () async {
                    await AuthService().signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  },
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    }else {
      return const Loader();
    }
  }
}
