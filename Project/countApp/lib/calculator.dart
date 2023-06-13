import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var num1Controller = TextEditingController();
  var num2Controller = TextEditingController();
  var num1 = "";
  var num2 = "";

  double result = 0;

  @override
  Widget build(BuildContext context) {

    addNumbers(double n1, double n2) {
      result = n1 + n2;
      setState(() {});
    }
    subNumbers(double n1, double n2) {
      result = n1 - n2;
      setState(() {});
    }
    mulNumbers(double n1, double n2) {
      result = n1 *n2;
      setState(() {});
    }
    divNumbers(double n1, double n2) {
      result = n1/n2;
      setState(() {});
    }
    clearResult() {
      result = 0;
      setState(() {});
    }
    clearField() {
      num1Controller.clear();
      num2Controller.clear();
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 6,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Result : ${result.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Fisrt Number",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Second Number",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        num1 = num1Controller.text.toString();
                        num2 = num2Controller.text.toString();

                        double n1 = double.parse(num1);
                        double n2 = double.parse(num2);

                        addNumbers(n1, n2);
                      },
                      child: const Text(
                        "+",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        num1 = num1Controller.text.toString();
                        num2 = num2Controller.text.toString();

                        double n1 = double.parse(num1);
                        double n2 = double.parse(num2);

                        subNumbers(n1, n2);
                      },
                      child: const Text(
                        "-",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        num1 = num1Controller.text.toString();
                        num2 = num2Controller.text.toString();

                        double n1 = double.parse(num1);
                        double n2 = double.parse(num2);

                        mulNumbers(n1, n2);
                      },
                      child: const Text(
                        "*",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        num1 = num1Controller.text.toString();
                        num2 = num2Controller.text.toString();

                        double n1 = double.parse(num1);
                        double n2 = double.parse(num2);

                        divNumbers(n1, n2);
                      },
                      child: const Text(
                        "/",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        clearResult();
                        clearField();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
