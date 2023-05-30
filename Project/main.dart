import 'dart:io';

double sg =0.0;
double calculator(int marks, int credit){
  if(marks<=100 && marks>=80){
    sg += (4.00 * credit);
  }

  return 0;

}

void main(){
  int n, marks, credit;
  print("Enter Number of courses : ");
  String str = stdin.readLineSync()!;
  n = int.parse(str);

  for(int i=0; i<n; i++){
    calculator(85, 2);
    print(sg);

  }
  

}