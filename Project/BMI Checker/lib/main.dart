import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter+=3;
    });
  }

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      appBar: AppBar(


      ),
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI CHECKER", style: TextStyle( fontSize: 25, fontWeight: FontWeight.w600),),

              SizedBox(height: 18,),

              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text("Enter Your Weight in KG"),
                  prefixIcon: Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 6,),

              TextField(
                controller: ftController,
                decoration: InputDecoration(
                    label: Text("Enter Your Height in Ft"),
                    prefixIcon: Icon(Icons.height)
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 6,),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                    label: Text("Enter Your Height in Inch"),
                    prefixIcon: Icon(Icons.height)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 14,),
              
              ElevatedButton(onPressed: (){
                var weight = wtController.text.toString();
                var height = ftController.text.toString();
                var inch = inController.text.toString();

                if(weight != "" && height != "" && inch != ""){
                  var wt = int.parse(weight);
                  var ht = int.parse(height);
                  var inc = int.parse(inch);

                  var totalHeight = (ht*12) + inc;

                  var  totalCM = totalHeight * 2.54;
                  var totalMeter = totalCM/100;

                  var bmi = wt/(totalMeter*totalMeter);

                  setState(() {
                    result = "Your BMI : ${bmi.toStringAsFixed(2)}";
                  });
                }
                else{
                  setState(() {
                    result = "Please Fill The All Fields";
                  });

                }



              }, child: Text("Calculate")),

              SizedBox(height: 12,),

              Text(result, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      )

    );
  }
}
