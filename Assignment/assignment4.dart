/*
Define an abstract class Account with the following properties:
● accountNumber (integer)
● balance (double)
It should also have the following methods:
● deposit(double amount): Adds the specified amount to the account balance.
● withdraw(double amount): Abstract method that deducts the specified amount from
the account balance.
Define a class SavingsAccount that extends the Account class. It should have an additional
property called interestRate (double).
Implement the withdraw() method in the SavingsAccount class as follows:
● Subtract the specified amount from the account balance.
● Apply the interest rate to the remaining balance.
Define a class CurrentAccount that extends the Account class. It should have an
additional property called overdraftLimit (double).
Implement the withdraw() method in the CurrentAccount class as follows:
● Allow withdrawals up to the overdraft limit.
● If the withdrawal amount exceeds the overdraft limit, print a message indicating
insufficient funds.


In main()
● Create an instance of the SavingsAccount class by providing values for the account
number, initial balance, and interest rate.
● Use the instance to perform operations like depositing and withdrawing money.
● Create an instance of the CurrentAccount class by providing values for the account
number, initial balance, and overdraft limit.
● Use the instance to perform operations like depositing and withdrawing.
*/

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
