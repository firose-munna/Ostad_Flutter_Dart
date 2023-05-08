List<int> getOddNumbers(List<int> number){
  List<int> oddNumbers = [];
  for(int num in number){
    if(num%2 == 1){
      oddNumbers.add(num);
    }
  }
  return oddNumbers;
}

void main(){
  List<int> numbers = [2, 5, 8, 11, 13, 18, 21, 24, 25, 89, 101, 104];
  List<int> oddNumbers = getOddNumbers(numbers);

  print("All Numbers : $numbers");
  print("Odd Numbers List : $oddNumbers");
}