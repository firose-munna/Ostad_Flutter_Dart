abstract class Student{
  void attendClass();

  void running();

  void eating(){
    print("I am eating mango.");
  }
}

class Person extends Student{
  @override
  void attendClass() {
    // TODO: implement attendClass
    print("I am a person, I am attending class.");
  }
  @override
  void running() {
    // TODO: implement running
    print("After class I will be running");
  }
}
class BusinessMan extends Student{
  @override
  void attendClass() {
    // TODO: implement attendClass
    print("I am a Business Man, I am attending the class");

  }
  @override
  void running() {
    // TODO: implement running
    print("I am running also");
  }
}


void main(){
  BusinessMan b = BusinessMan();
  Person p  = Person();

  Student p2 = Person();

  b.attendClass();
  b.eating();
  b.running();

  p.attendClass();
  p.running();
  p.eating();
  
  p2.attendClass();

}
