import 'package:flutter_design_patterns/Display/design_pattern.dart';

class Decorator extends DesignPattern {
  Decorator([String filePath = "lib/Structural/Decorator.dart"])
      : super("UK  /ˈdek.ər.eɪ.tər/ US  /ˈdek.ər.eɪ.t̬ɚ/",filePath);

  @override
  String testRun() {

    // I want a coffee in the first cup
    ICoffee coffee0 = BasicCoffee();

    // I want to add milk to the second cup
    ICoffee coffee1 = BasicCoffee();
    coffee1 = Milk(coffee1);

    // I want to add the third cup
    ICoffee coffee2 = BasicCoffee();
    coffee2 = Milk(coffee2);
    coffee2 = Whip(coffee2);
    coffee2 = Vanilla(coffee2);

    return """
    
     ${coffee0.getDescription()}
    Price : ${coffee0.getCost()}
    
    ${coffee1.getDescription()}
    Price : ${coffee1.getCost()}
    
    ${coffee2.getDescription()}
    Price: ${coffee2.getCost()}
    """;
  }
}

// Coffee can be topped up, but the toppings will cost more, so what should I do?
abstract class ICoffee {
  double getCost();

  String getDescription();
}

class BasicCoffee implements ICoffee {
  @override
  double getCost() => 5;

  @override
  String getDescription() => "Normal Coffee";
}

// General coffee is used as a base, so that it can be added with various seasonings
class CoffeeDecorator implements ICoffee {

  ICoffee coffee;

  CoffeeDecorator(this.coffee);


  @override
  double getCost() => coffee.getCost();

  @override
  String getDescription() => coffee.getDescription();
}

// milk
class Milk extends CoffeeDecorator {

  Milk(ICoffee coffee)
      : super(coffee);

  @override
  double getCost() => super.getCost() + 2;

  @override
  String getDescription() => super.getDescription() + ", Milk";
}

// fresh cream
class Whip extends CoffeeDecorator {

  Whip(ICoffee coffee)
      : super(coffee);

  @override
  double getCost() => super.getCost() + 3;

  @override
  String getDescription() => super.getDescription() + ", Whip";
}

// vanilla
class Vanilla extends CoffeeDecorator {

  Vanilla(ICoffee coffee)
      : super(coffee);

  @override
  double getCost() => super.getCost() + 4;

  @override
  String getDescription() => super.getDescription() + ", Vanilla";
}
