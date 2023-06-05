import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
      color: Colors.teal,
    );
  }

}
class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 7,
        title: Text("Live Test App", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person)),
        ],

      ),

       body: Center(
          child: Text("Hello Ostad. This app is developed by Firose", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Firose Munna")),
            ListTile(title: Text("Home"),),
            ListTile(title: Text("Account"),),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.large(

        child: Icon(Icons.add, size: 56, ),
        backgroundColor: Colors.cyan,

        onPressed: (){},

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,


    );
  }



}

