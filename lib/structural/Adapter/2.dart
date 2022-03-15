import 'package:flutter_design_patterns/Display/design_pattern.dart';


//
class Adapter extends DesignPattern {
  Adapter([ipa,sourceFilePath,topics]) : super(ipa,sourceFilePath,topics);


  @override
  String testRun() {
    var bankCustomer= BankCustomerAdapter(100000);
    bankCustomer.giveBankDetails();

    return """
    // the BankCustomer class is the adapter between BankDetails class and  CreditCard interface
    ${bankCustomer.getCreditCard()}
    """;
  }
}


//adapter
abstract class ICreditCard {
  void giveBankDetails();
  String getCreditCard();
}

//Adaptee
class BankDetailsAdaptee{
  String? bankName;
  String? accountHolderName;
  final int accountNumber;

  BankDetailsAdaptee(this.accountNumber);

  @override
  String toString() {
    return 'BankDetails{bankName: $bankName, accountHolderName: $accountHolderName, accountNumber: $accountNumber}';
  }
}

//concreteAdapter
class BankCustomerAdapter  implements ICreditCard {
  BankDetailsAdaptee? bankDetailsAdaptee;

  BankCustomerAdapter(int accountNumber){
    bankDetailsAdaptee =BankDetailsAdaptee(accountNumber);
  }



  @override
  void giveBankDetails() {
    Bank bank =Bank();
    int index = bank.clients.indexWhere((element) =>
    element.accountNumber == bankDetailsAdaptee!.accountNumber);
    if (index != -1) {
      bankDetailsAdaptee!.accountHolderName=bank.clients[index].name;
      bankDetailsAdaptee!.bankName=bank.clients[index].bankName;
    }

  }

  @override
  String getCreditCard() => super.toString();

}
class Client{
  final String name;
  final String bankName;
  final int accountNumber;

  Client(this.name, this.bankName, this.accountNumber);
}

class Bank{
  late List<Client> clients;

  Bank(){
    clients =[];
    clients.add( Client("Mark", "bank_name",000000));
    clients.add(Client("Jennifer", "bank_name",100000));
  }
}
