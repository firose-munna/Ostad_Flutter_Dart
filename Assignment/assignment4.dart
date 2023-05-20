abstract class Account{
  late int accountNumber;
  late double balance;
  void deposit(double amount){
    balance += amount;
  }
  void withdraw(double amount);
}

class SavingsAccount extends Account{
  late double interestRate;

  @override
  void withdraw(double amount) {
    // TODO: implement withdraw
    balance -= amount;
    balance*=(interestRate+1.0);
  }
}

class CurrentAccount extends Account{
  late double overdraftLimit;
  @override
  void withdraw(double amount) {
    // TODO: implement withdraw
    if(amount>=overdraftLimit){
      print("Insufficient Funds");
    }
    else{
      balance-=amount;
    }
  }
}

void main(){
  SavingsAccount sAccount = SavingsAccount();
  sAccount.accountNumber = 10001;
  sAccount.balance = 100000.00;
  sAccount.interestRate = 0.3;

  print("Initial Balance - ");
  print("Account Number : ${sAccount.accountNumber}");
  print("Current Balance : ${sAccount.balance}\n");


  sAccount.deposit(5000.00);
  print("After Deposit - ");
  print("Account Number : ${sAccount.accountNumber}");
  print("Current Balance : ${sAccount.balance}\n");

  sAccount.withdraw(75000.00);
  print("After Withdraw - ");
  print("Account Number : ${sAccount.accountNumber}");
  print("Current Balance : ${sAccount.balance}\n");


  CurrentAccount cAccount = CurrentAccount();
  cAccount.accountNumber = 10002;
  cAccount.balance = 500000.00;
  cAccount.overdraftLimit = 50000.00;


  print("Initial Balance - ");
  print("Account Number : ${cAccount.accountNumber}");
  print("Current Balance : ${cAccount.balance}\n");


  cAccount.deposit(5000.00);
  print("After Deposit - ");
  print("Account Number : ${cAccount.accountNumber}");
  print("Current Balance : ${cAccount.balance}\n");

  cAccount.withdraw(25000.00);
  print("After Withdraw - ");
  print("Account Number : ${cAccount.accountNumber}");
  print("Current Balance : ${cAccount.balance}\n");

  cAccount.withdraw(250000.00);
  print("After Withdraw - ");
  print("Account Number : ${cAccount.accountNumber}");
  print("Current Balance : ${cAccount.balance}\n");
}