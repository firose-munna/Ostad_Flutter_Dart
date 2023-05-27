class Animal{
  late String name;
  void eat(){
    print("$name is eating.");
  }
}
class Dog extends Animal{
  void display(){
    print("Name : $name");
    eat();
  }
}

void main(){
  Dog labrador = Dog();
  labrador.name = "Labrador";
  labrador.display();
}