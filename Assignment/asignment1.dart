/*Take a list of phone numbers example
phoneNumber = [ +88, 01768131685, 01768171985, 01768111286, 01768131685]
And write program that prints out the full number like ‘+8801768171985’ You
 have to print out all numbers given in the list except +88.
*/

void main(){

  List<String> phoneNumber = ['+88', '01768131685', '01768171985', '01768111286', '01768131685'];

  print(phoneNumber[0]+phoneNumber[1]);
  print(phoneNumber[0]+phoneNumber[2]);
  print(phoneNumber[0]+phoneNumber[3]);
  print(phoneNumber[0]+phoneNumber[4]);
}
