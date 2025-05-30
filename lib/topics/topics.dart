import 'package:fireship/services/firestore.dart';
import 'package:fireship/shared/loader.dart';
import 'package:fireship/topics/topicItem.dart';
import 'package:flutter/material.dart';

import '../services/models.dart';
import '../shared/bottom_nav.dart';
import 'drawer.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return const LoadingScreen();
            }else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }else if (snapshot.hasData) {
              var topics =snapshot.data!;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.deepPurple,
                  title: const Text('Topics'),
                ),
                drawer: TopicDrawer(topics: topics),
                body: GridView.count(
                  primary: false,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    children: topics.map((topic) => TopicItem(topic: topic)).toList(),
                ),
                bottomNavigationBar: const BottomNavBar(),
              );
            }else {
              return const Text('No topics found in Firestore. check database');
            }
          }
        );
  }
}
