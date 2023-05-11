class MyClass{

  static int number = 125;

  static showMyself(){
    print("Hii, I am Firose Munna");
  }
  MyClass(){
    print("Hello evreryone, I am from Constructor....");
  }
}

void main(){
  MyClass obj = MyClass();

  MyClass.showMyself();
  print(MyClass.number);

  MyClass.number = 456;

  print(MyClass.number);
}