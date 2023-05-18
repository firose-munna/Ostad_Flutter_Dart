class Animal{
  void eat(){
    print("I can eat.");
  }
}
class Dog extends Animal{
  @override
  void eat() {
    // TODO: implement eat
    super.eat();
    print("I can eat dog food.");
  }
}

class Cat extends Animal{
  @override
  void eat() {
    // TODO: implement eat
    super.eat();
    print("I can eat cat food.");
  }
}

void main(){
  Dog dog = Dog();
  Cat cat = Cat();

  dog.eat();
  cat.eat();

  
}