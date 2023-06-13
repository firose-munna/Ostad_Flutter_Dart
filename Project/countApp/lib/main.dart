import 'package:counter_app/calculator.dart';

import 'counterApp.dart';
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
      home: Homepage(),
    );
  }
}
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 35,
                width: 140,
                child: ElevatedButton(
                  child: Text("Counter App", style: TextStyle(fontSize: 18),),
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CounterApp()));

                    },
                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 35,
                width: 140,
                child: ElevatedButton(
                  child: Text("Calculator", style: TextStyle(fontSize: 18),),
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Calculator()));
                  },
                ),

              ),
            )
          ],
        ),
      ),
    );

  }
}

