/*
This is my first project using dart. It is a console application. Here I am trying to used different function. Like sum for summation, sub for subtraction,
mult for multiplication, div for division, mod for modulas, pow for square and calculator function for the main task.
*/


import 'dart:io';

dynamic sum(var a, var b){
  return a+b;
}
dynamic sub(var a, var b){
  return a-b;
}
dynamic mult(var a, var b){
  return a*b;
}
dynamic div(var a, var b){
  return a/b;
}
dynamic mod(var a, var b){
  return a%b;
}
dynamic pow(var a, var b){
  var sum =a;
  for(int i=1; i<b; i++){
    sum*=a;
  }
  return sum;
}

void calculator(){
  var result;
  print("Enter Two Integer Numbers: ");
  var n1 = int.parse(stdin.readLineSync()!);
  var n2 = int.parse(stdin.readLineSync()!);

  print("Enter the operator : ");
  String op = stdin.readLineSync()!;

  if(op == "+"){
    result = sum(n1, n2);
  }
  else if(op == "-"){
    result = sub(n1, n2);
  }
  else if(op == "*"){
    result = mult(n1, n2);
  }

  else if(op == "/"){
    result = div(n1, n2);
  }
  else if(op == "%"){
    result = mod(n1, n2);
  }
  else if(op == "^"){
    result = pow(n1, n2);
  }
  else{
    print("Invalid Operator");
  }

  print("Result = $result");
}
void main(){
  var t=0;
  while(t==0){
    calculator();
    print("Calculate Again (y/n) : ");
    String check = stdin.readLineSync()!;
    if(check == 'y'){
      t=0;
    }
    else if(check == 'n'){
      t=1;
    }
    else{
      print("Invalid Command");
    }
  }



}
