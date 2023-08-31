import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livetest7app/match_details_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Score',
      home: HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 22),
            child: Text("WorldCup 2023"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.sports_football),
          ),

        ],
      ),
      body: StreamBuilder(
        stream: firestore.collection('Fifa_WorldCup2023').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError == true) {
            return Center(child: Text(snapshot.error.toString()));
          }
          else if (snapshot.hasData && snapshot.data?.docs.isEmpty == true) {
            return const Center(child: Text('No Match Found'));
          }
          else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text('${snapshot.data!.docs[index].get('team_name_a')} vs ${snapshot.data!.docs[index].get('team_name_b')}', style: const TextStyle(fontSize: 18),),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        navigateToMatchDetailsScreen(snapshot.data!.docs[index].id);
                      },
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void navigateToMatchDetailsScreen(String matchId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MatchDetails(matchId: matchId,),
      ),
    );
  }
}
