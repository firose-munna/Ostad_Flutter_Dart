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