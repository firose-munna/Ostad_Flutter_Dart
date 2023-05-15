/* Create a class Car with the following properties:
● brand: a string representing the brand of the car 
● model: a string representing the model of the car
● year: an integer representing the year the car was made
● milesDriven: a double representing the number of miles driven by the car
The class should have the following methods:
● drive(double miles): a method that takes a double parameter representing the
number of miles driven and adds it to the milesDriven property
● getMilesDriven(): a method that returns the value of the milesDriven property
● getBrand(): a method that returns the value of the brand property
● getModel(): a method that returns the value of the model property
● getYear(): a method that returns the value of the year property

● getAge(): a method that returns the age of the car (i.e. the difference between the
current year and the year property)
★ The class should also have a static property called numberOfCars that keeps track
of the number of Car objects that have been created. This property should be
incremented every time a Car object is created.
In the main() function, create three Car objects with different brands, models, and years.
Drive each car a different number of miles using the drive() method.
Print out the brand, model, year, and miles driven for each car using the
getBrand(), getModel(), getYear(), and getMilesDriven() methods, respectively.
Also print out the age of each car using the getAge() method.
Finally, print out the total number of Car objects created using the numberOfCars static
property. */

class Car{
  static int numberOfCars=0;

  late String brand;
  late String  model;
  late int year;
  late double milesDriven;

  Car(){
    numberOfCars++;
  }

  void drive(double miles){
    milesDriven = miles;
  }
  double getMilesDriven(){
    return milesDriven;
  }
  String getBrand(){
    return brand;
  }
  String getModel(){
    return model;
  }
  int getYear(){
    return year;
  }
  int getAge(){
    return 2023-year;
  }
}

void main(){
  Car car1 = Car();
  Car car2 = Car();
  Car car3 = Car();

  car1.brand = "Ferrari";
  car1.model = "Ferrari 488";
  car1.year = 1947;

  car2.brand = "BMW";
  car2.model = "1 Series (F52)";
  car2.year = 2017;

  car3.brand = "BMW";
  car3.model = "BMW X1";
  car3.year = 2009;

  car1.drive(110.50);
  car2.drive(100.75);
  car3.drive(90.45);


  print("Brand Name : ${car1.getBrand()}");
  print("Model Name : ${car1.getModel()}");
  print("Launch Year : ${car1.getYear()}");
  print("Miles : ${car1.getMilesDriven()}");
  print("Age of the Car : ${car1.getAge()}\n");

  print("Brand Name : ${car2.getBrand()}");
  print("Model Name : ${car2.getModel()}");
  print("Launch Year : ${car2.getYear()}");
  print("Miles : ${car2.getMilesDriven()}");
  print("Age of the Car : ${car2.getAge()}\n");

  print("Brand Name : ${car3.getBrand()}");
  print("Model Name : ${car3.getModel()}");
  print("Launch Year : ${car3.getYear()}");
  print("Miles : ${car3.getMilesDriven()}");
  print("Age of the Car : ${car3.getAge()}\n");

  print("Total Number of Car : ${Car.numberOfCars}");


}
