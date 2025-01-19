import 'bank_account.dart';

class SavingsAccount extends BankAccount{
  SavingsAccount(super.accountNumber, super.accountHolderName);
  checkInterest(){
    double interest = balance * 0.0008;
    print('Interest on Account Balance is: $interest BDT');
  }
}