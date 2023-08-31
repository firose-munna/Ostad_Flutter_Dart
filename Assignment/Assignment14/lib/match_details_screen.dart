
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetails extends StatelessWidget {
  final String matchId;
  MatchDetails({super.key, required this.matchId});

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(matchId),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: StreamBuilder(
        stream: firestore.collection('Fifa_WorldCup2023').doc(matchId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError == true) {
            return Center(child: Text(snapshot.error.toString()));
          }
          else if (snapshot.hasData && snapshot.data!.exists == false) {
            return const Center(child: Text('No Match Found'));
          }
          else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: SizedBox(
                  height: 120,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${snapshot.data!.get('team_name_a')} vs ${snapshot.data!.get('team_name_b')}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("${snapshot.data!.get('score_team_a')} : ${snapshot.data!.get('score_team_b')}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Time : ${snapshot.data!.get('time')}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Total Time : ${snapshot.data!.get('total_time')}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}