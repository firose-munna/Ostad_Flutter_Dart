import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {

  int number=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Counter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
        centerTitle: true,
        elevation: 6,

      ),

      body: Center(
        child: Text("Counting Number : $number", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            number+=2;
          });
        },
        child: Icon(Icons.add),
      ),


    );
  }
}
