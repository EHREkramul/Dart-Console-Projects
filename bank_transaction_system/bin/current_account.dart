import 'bank_account.dart';

class CurrentAccount extends BankAccount{
  CurrentAccount(super.accountNumber, super.accountHolderName, this.overdraftLimit);

  late double overdraftLimit = 1000;
  double _overdraftLoan = 0;

  @override
  withdraw(double amount) {
    try {
      if (balance + overdraftLimit < amount) {
        throw Exception('Insufficient Fund');
      } else {
        if(balance>= amount){
          balance -= amount;
          print('Withdraw Successful. New Balance: $balance');
        }else if(balance+overdraftLimit>=amount){
          _overdraftLoan += amount-balance;
          overdraftLimit -= amount-balance;
          balance = 0;

          print('Withdraw $amount Successful. Overdraft Loan: $_overdraftLoan');
          print('New overdraft Limit: $overdraftLimit');
          super.checkBalance();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}