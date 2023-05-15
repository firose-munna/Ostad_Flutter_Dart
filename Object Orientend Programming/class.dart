void main(){
  Students student1 = Students();
  Students student2 = Students();

  //information about student 1....
  student1.studentName = "Firose Munna";
  student1.studentId = 19201103003;
  student1.department = "CSE";
  student1.age = 23;
  student1.cgpa = 3.98;

  print("Information of Student No 1 : ");
  print(student1.studentName);
  print(student1.studentId);
  print(student1.department);
  print(student1.age);
  print(student1.cgpa);

  //information about student 2...
  student2.studentName = "Arafat Hossan";
  student2.studentId = 19201103039;
  student2.department = "CSE";
  student2.age = 24;
  student2.cgpa = 3.75;

  print("Information of Student No 2 : ");
  print(student2.studentName);
  print(student2.studentId);
  print(student2.department);
  print(student2.age);
  print(student2.cgpa);

}

class Students{
  late String studentName;
  late  int studentId;
  late String department;
  late int age;
  late double cgpa;
}