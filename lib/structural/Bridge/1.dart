import 'dart:ui';

import 'package:flutter_design_patterns/Display/design_pattern.dart';


class Bridge extends DesignPattern {
  Bridge([ipa,sourceFilePath,topics]) : super(ipa,sourceFilePath,topics);

  @override
  String testRun() {
    final lightMode = LightMode();
    final darkMode = DarkMode();

    final homePage = HomePage(lightMode);


    String string = """
    // Check our home page with light mode.
    ${homePage.content()}
    """;
    homePage.setMode(darkMode);

    string = string+"""
    change to dark mode 
    """;

    return string+"""       
    // Check our home page with dark mode.
    ${homePage.content()}
    """;
  }
}

//implementator
abstract class IMode {
  String getColor();
}

//concrete implementor A
class DarkMode implements IMode {
  @override
  String getColor() => "Dark mode";
}
//concrete implementor B
class LightMode implements IMode {
  @override
  String getColor() => "Light mode";
}

//abstraction
abstract class AbstractWebPage {
  IMode mode;

  AbstractWebPage(this.mode);

  void setMode(IMode m);
  String content();
}

class HomePage extends AbstractWebPage {
  HomePage(IMode mode) : super(mode);

  @override
  String content() =>
      "This is home page in ${mode.getColor()} color";

  @override
  void setMode(IMode m) {
    mode = m;
  }
}

class ContactPage extends AbstractWebPage {
  ContactPage(IMode mode) : super(mode);

  @override
  String content() =>
      "This is contact page in ${mode.getColor()} color";

  @override
  void setMode(IMode m) {
    mode = m;
  }
}


