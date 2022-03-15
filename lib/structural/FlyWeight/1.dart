import 'dart:collection';

import 'package:flutter_design_patterns/Display/design_pattern.dart';


class FlyWeight extends DesignPattern {
  FlyWeight([ipa,sourceFilePath,topics]) : super(ipa,sourceFilePath,topics);

  @override
  String testRun() {
    CarFactory carFactory =  CarFactory();
    String result ="";
    for(int x = 1; x < 5; x = x + 1) {
      String print1  = carFactory.getCar("Chevrolet");
      String print2  = "\nA Chevrolet car was drawn in position (x, y)=($x,10)";
      result = result + print1 + print2;

    }

    for(int x = 1; x < 5; x = x + 1) {
      String print1  = carFactory.getCar("BMW");
      String print2  ="\nA BMW car was drawn in position (x, y)=($x,10)";
      result = result +  print1 + print2;
    }

    return result;
  }
}

abstract class ICar {
 String build();
}

class Chevrolet implements ICar{
   String build()=>"A Chevrolet car has been built.";
}

class BMW implements ICar{
  String build()=>"A BMW car has been built.";
}

class Renault implements ICar{
  String build()=>"A Renault car has been built.";
}

class CarFactory {

  Map<String, ICar> carsList =  HashMap();

   String getCar(String carType) {

     print("carsList[carType] ${carsList[carType]}");
    ICar? car = carsList[carType];

      if (carType == "Chevrolet") {
        car =  Chevrolet();
        carsList.addAll({"Chevrolet": car});
        return "A Chevrolet car was CREATED and saved in memory";

      } else if (carType == "BMW") {
        car =  BMW();
        carsList.addAll({"BMW": car});
        return "A BMW car was CREATED and saved in memory";

      } else if (carType == "Renault") {
        car = new Renault();
        carsList.addAll({"Renault": car});
        return "A Renault car was CREATED and saved in memory";
      }


    return "Error";
  }
}
