import 'package:flutter_design_patterns/Display/design_pattern.dart';

class Composite extends DesignPattern {
  Composite([String filePath = "lib/Structural/Composite.dart"])
      : super("UK  /ˈkɒm.pə.zɪt/ US  /ˈkɑːm.pə.zɪt/",filePath);

  @override
  String testRun() {

    var CEO =  Employee("John","CEO", 30000);

    var headSales =  Employee("Robert","Head Sales", 20000);

    var headMarketing =  Employee("Michel","Head Marketing", 20000);

    var clerk1 =  Employee("Laura","Marketing", 10000);
    var clerk2 =  Employee("Bob","Marketing", 10000);

    var salesExecutive1 =  Employee("Richard","Sales", 10000);
    var salesExecutive2 =  Employee("Rob","Sales", 10000);

    CEO.add(headSales);
    CEO.add(headMarketing);

    headSales.add(salesExecutive1);
    headSales.add(salesExecutive2);

    headMarketing.add(clerk1);
    headMarketing.add(clerk2);

    String result ="";
    //print all employees of the organization
    result = CEO.toString();

    CEO.getSubordinates().forEach((element) {

      result  = result + element.toString();

      element.getSubordinates().forEach((element) {
        result  = result + element.toString();
      });
    });


    return result;
  }
}

// Company employees can have developers and designers
 class Employee {
  String name;
  String? role;
  double salary;
  List<Employee>? subordinates;

  void add(Employee e) {
    if(subordinates == null)  subordinates =[];
    subordinates!.add(e);
  }

  void remove(Employee e) {
    subordinates!.remove(e);
  }

   List<Employee> getSubordinates(){
    return subordinates!;
  }

  Employee(this.name, this.role,this.salary, [this.subordinates]);

  @override
  String toString() {
    return 'Employee{name: $name, role: $role, salary: $salary, subordinates: $subordinates}';
  }
}

