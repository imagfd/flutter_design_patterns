import 'package:flutter_design_patterns/Display/design_pattern.dart';


class Bridge extends DesignPattern {
  Bridge([ipa,sourceFilePath,topics]) : super(ipa,sourceFilePath,topics);

  @override
  String testRun() {
    Shape tri =  Triangle( YellowColor());


    Shape pent =  Rectangle( GreenColor());



    return """       
    ${ tri.applyColor()}
    ${ pent.applyColor()}
    """;
  }
}

//implementator
abstract class IColor {
  String applyColor();
}

//concrete implementor A
class YellowColor implements IColor{

  String applyColor()=>"yellow.";

}
//concrete implementor B
class GreenColor implements IColor{

  String applyColor()=>"green.";
}

//abstraction
abstract class Shape {
  IColor? color;

  //constructor with implementor as input argument
  Shape(IColor c){
    this.color=c;
  }

  applyColor();
}


class Triangle extends Shape{

  Triangle(IColor c) : super(c);

  @override
  String applyColor() {
    return "Triangle filled with color "+color!.applyColor();
  }

}

class Rectangle extends Shape{

  Rectangle(IColor c) : super(c);

  @override
  String applyColor() {
    return "Rectangle filled with color "+color!.applyColor();
  }

}

