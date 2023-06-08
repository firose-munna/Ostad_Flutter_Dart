import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),

      home: MainActivity(),
    );
  }
}

class MainActivity extends StatelessWidget {


  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text("FunBook", style: TextStyle(fontSize: 20),),
        elevation: 6,
        centerTitle: true,

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active))
        ],

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Text("Login Page", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                child: TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    label: Text("User Name"),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    

                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
                child: TextField(
                  controller: _passwordController,

                  decoration: InputDecoration(
                    label: Text("Password"),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),


                  ),

                ),
              ),

              ElevatedButton(onPressed: (){}, child: Text("login"))
            ],
          ),
        ),
      )




    );
  }
}

