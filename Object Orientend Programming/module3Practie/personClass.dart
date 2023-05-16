class Person{
  late String _name;
  late int _age;
  Person(String name, int age){
    _name = name;
    _age = age;
  }
  void _getPersonInfo(){
    print("Person's Name : $_name");
    print("Person's Age : $_age");
  }
  void getInfo(){
    print("Basic Information");
    this._getPersonInfo();
    print("");

  }
}

