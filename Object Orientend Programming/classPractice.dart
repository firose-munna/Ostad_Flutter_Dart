class Students{
  late String name;
  late int id;
  late String department;
  late double cgpa;
  late String dateOfBirth;
  late String address;
  late String phoneNumber;

  void showStudents(){
    print("Name of the Student is : $name");
    print("ID : $id");
    print("Department Name : $department");
    print("Current CGPA : $cgpa");
    print("Date of Birth : $dateOfBirth");
    print("Current Address : $address");
    print("Phone Number : $phoneNumber");
    print("");
  }
}

void main(){
  Students student1 = Students();
  Students student2 = Students();
  Students student3 = Students();

  student1.name = "Md Firose Mahmud";
  student1.id = 19201103003;
  student1.department = "CSE";
  student1.cgpa=3.98;
  student1.dateOfBirth="15/03/2000";
  student1.address = "Mirpur 2, Block H, Road 9";
  student1.phoneNumber = "01956431180";

  student2.name = "Md Arafat Hossan";
  student2.id = 19201103039;
  student2.department = "CSE";
  student2.cgpa = 3.75;
  student2.dateOfBirth = "05/02/1999";
  student2.address = "Mirpur 1";
  student2.phoneNumber = "01717367522";

  student3.name = "Al Imran";
  student3.id = 22235103365;
  student3.department = "CSE";
  student3.cgpa = 4.00;
  student3.dateOfBirth = "05/02/2002";
  student3.address = "Mirpur 10";
  student3.phoneNumber = "01717367521";


  student1.showStudents();
  student2.showStudents();
  student3.showStudents();
}