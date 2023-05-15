class Person{
  late String name;
  late int age;
  late String address;
  Person(String name, int age, String address){
    this.name = name;
    this.age = age;
    this.address = address;
  }
  void sayHello(){
    print("Hello, my name is $name.");
  }
  int getAgeInMonths(){
    return this.age*12;
  }
}

void main(){
  Person munna = Person("Md Firose Mahmud Munna", 23, "Road 9, Block H, House 12,Mirpur2");

  munna.sayHello();
  print(munna.getAgeInMonths());
}