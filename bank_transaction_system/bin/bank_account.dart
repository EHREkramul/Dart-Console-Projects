abstract class BankAccount {

  BankAccount(this.accountNumber, this.accountHolderName);

  late int accountNumber;
  late String accountHolderName;
  double balance = 0;

  deposit(double amount) async {
    try {
      if (amount > 100) {
        print('Depositing $amount into account $accountNumber');
        await Future.delayed(Duration(seconds: 3));
        balance += amount;
        print('Account Deposited with $amount. New Balance: $balance');
      } else {
        throw Exception('Minimum Deposit Amount 100');
      }
    } catch (e) {
      print(e);
    }
  }

  withdraw(double amount) {
    try {
      if (balance < amount) {
        throw Exception('Insufficient Fund');
      } else {
        balance -= amount;
        print('Withdraw Successful. New Balance: $balance');
      }
    } catch (e) {
      print(e);
    }
  }

  checkBalance() {
    print('Account Balance: $balance');
  }
}
