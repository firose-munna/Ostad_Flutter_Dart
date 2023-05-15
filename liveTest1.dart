/*Create a map (key value pair) of an employee, * the keys will be employee = [Id, Name, Age, Salary, Gender].
In this map [Id, Age, Salary] only these three keys' values
will be in number.
At last print out the Salary from the map
*/

void main(){
  Map<String, dynamic> employee={
    "Id" : 1,
    "Name": "Firose Munna",
    "Age" : 23,
    "Salary" : 70000,
    "Gender" : "Male"
  };

  print(employee["Salary"]);
}
