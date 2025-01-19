import 'savings_account.dart';
import 'current_account.dart';

void main() async{
  SavingsAccount sv1 = SavingsAccount(123,"Ekramul Haque");
  CurrentAccount cr1 = CurrentAccount(123,"Ekramul Haque",1400);

  await sv1.deposit(1000);
  sv1.withdraw(500);
  sv1.checkBalance();
  sv1.checkInterest();

  await cr1.deposit(700);
  cr1.withdraw(1000);
}
