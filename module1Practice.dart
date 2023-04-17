void main(){
  print("Hello World");


  int a = 20;
  int b = 8;
  String str = "My name is Munna.";
  int age = 23;
  double height = 5.5;
  bool isBangladeshi = true;

  print(a);
  print(b);
  print(str);
  print(height);
  print(isBangladeshi);

  int sum = a +b;
  int sub = a-b;
  int mul = a*b;
  double div = a/b;
  int mod = a%b;

  print(sum);
  print(sub);
  print(mul);
  print(div);
  print(mod);

  print(str +" Age is : " +age.toString() + " Years old");


  List<int> numList = [1, 2, 45, 76, 87];
  print("Number List is : "+numList.toString());
  print("First Number of the List is : "+numList.first.toString());
  print("Last Number of the list is : "+numList.last.toString());
  print("Length of the list is "+numList.length.toString());
  print(numList[3]);
  print("The last number of this list is ${numList.last}");


  Map<int, String> stdnt ={
    1: "Firose",
    2: "Munna",
    3: "Munmun",
    4: "Babu",
    5: "Rafiqul"
  };
  print(stdnt);
  print(stdnt[1]);
  print(stdnt.length);
 



}
