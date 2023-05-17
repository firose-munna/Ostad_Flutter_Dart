class Father{
  String title ="Mojumdar";


  void property(){
    print("Father's Property : House, Car, Land, Pond, Books");
  }
}
class Child extends Father{


  @override
  void property() {
    print("Bongsher Nam : $title");
    // TODO: implement property
    super.property();
    print("Child Property : Bike, Clothe");
  }
}
class grandChild extends Child{
  @override
  void property() {
    // TODO: implement property
    super.property();
    print("GrandChild Property : I have no Property right now.");
  }
}

void main(){
  Child obj1 = Child();
  grandChild obj2 = grandChild();
  obj1.property();
  obj2.property();
}