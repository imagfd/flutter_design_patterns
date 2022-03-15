import 'dart:collection';

import 'package:flutter_design_patterns/Display/design_pattern.dart';

class FlyWeight extends DesignPattern {
  FlyWeight([ipa,sourceFilePath,topics]) : super(ipa,sourceFilePath,topics);

  static List<Coffee> coffees =  List.generate(20, (index) =>  Coffee());
  static List<CoffeeContext> tables = List.generate(20, (index) =>  CoffeeContext());
  static int ordersCount = 0;
  static CoffeeFactory? coffeeFactory;

   static void takeOrder(String flavorIn, int table) {
    coffees[ordersCount] = coffeeFactory!.getCoffeeFlavor(flavorIn);
    tables[ordersCount] = new CoffeeContext(table);
    ordersCount++;
  }

  @override
  String testRun() {
     print("Waitress serving coffee ");
    coffeeFactory = new CoffeeFactory();
//Waitress serving coffee
    takeOrder("Cappuccino", 2);
    takeOrder("Cappuccino", 2);
    takeOrder("Regular Coffee", 1);
    takeOrder("Regular Coffee", 2);
    takeOrder("Regular Coffee", 3);
    takeOrder("Regular Coffee", 4);
    takeOrder("Cappuccino", 4);
    takeOrder("Cappuccino", 5);
    takeOrder("Regular Coffee", 3);
    takeOrder("Cappuccino", 3);

    for (int i = 0; i < ordersCount; ++i) {
      coffees[i].serveCoffee(tables[i]);
    }

//coffee is served to 10 tables, but only 2 coffees are created ever!
    return "Total Coffee objects made: ${coffeeFactory!.getTotalCoffeeFlavorsMade()}";
  }
}
// Flyweight object interface
abstract class ICoffee {
 String serveCoffee(CoffeeContext context);
}


// Concrete Flyweight object
class Coffee implements ICoffee {
  final String? flavor;

  Coffee([this.flavor]) ;

  @override
  String serveCoffee(CoffeeContext context) =>"Serving $flavor to table $context.getTable()" ;

}

// A context, here is table number
class CoffeeContext {
  final int? tableNumber;

  CoffeeContext([this.tableNumber]);
}


//The FlyweightFactory :it only create a new coffee when necessary.
class CoffeeFactory {

  Map<String, Coffee>? flavors = HashMap();


  Coffee getCoffeeFlavor(String flavorName) {
    Coffee? flavor = flavors![flavorName];
    if (flavor == null) {
      flavor = new Coffee(flavorName);
      flavors!.addAll({flavorName: flavor});
    }
    return flavor;
  }

  int getTotalCoffeeFlavorsMade() {
    return flavors!.length;
  }
}