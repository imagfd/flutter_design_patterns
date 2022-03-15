import 'package:flutter_design_patterns/Display/design_pattern.dart';

class Proxy extends DesignPattern {
  Proxy([String filePath = "lib/Structural/Proxy.dart"]) : super("UK  /ˈprɒk.si/ US  /ˈprɑːk.si/",filePath);

  @override
  String testRun() {

    ProxyInternetAccess proxyInternetAccess1 =new ProxyInternetAccess("Jennifer");
    ProxyInternetAccess proxyInternetAccess2 =new ProxyInternetAccess("Mark");

    return """
    // Jennifer is a  developer , she wants to access a social networking site.
    ${proxyInternetAccess1.grantInternetAccess()}
    
    // Mark is a company Manager, he wants to access a social networking site.
    ${proxyInternetAccess2.grantInternetAccess()}
    """;
  }
}

// Subject
abstract class IInternetAccessService {
  String grantInternetAccess();
}

// Real subject
class RealInternetAccess implements IInternetAccessService {
  @override
  String grantInternetAccess() {
    return "you're allowed to access this page";
  }

}

// Proxy.
class ProxyInternetAccess implements IInternetAccessService {
  RealInternetAccess? realInternetAccess;
  final String employeeName;

  ProxyInternetAccess(this.employeeName);


  @override
  String grantInternetAccess() {
    Company company = Company();
    int index = company.employees.indexWhere((element) => element.name == employeeName);
    if(index !=-1){
      if(company.employees[index].role==1) {
        if(realInternetAccess == null) realInternetAccess = RealInternetAccess();
         return realInternetAccess!.grantInternetAccess();
      }else
        return "you're not allowed to access this page";;
    }
    return "Error";
  }
}


class Employee{
  final String name;
  final int role;

  Employee(this.name, this.role);
}

class Company{
  late List<Employee> employees;

  Company(){
    employees =<Employee>[];
    employees.add( Employee("Mark", 1));
    employees.add( Employee("Jennifer", 5));
  }
}