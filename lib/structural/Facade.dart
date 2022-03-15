import 'package:flutter_design_patterns/Display/design_pattern.dart';

class Facade extends DesignPattern {
  Facade([String filePath = "lib/Structural/Facade.dart"]) : super("UK  /fəˈsɑːd/ US  /fəˈsɑːd/",filePath);

  @override
  String testRun() {
    LightingControl lightingControl =  LightingControl();
    TemperatureControl temperatureControl =  TemperatureControl();
    EquipmentControl equipmentControl =  EquipmentControl();
    SmartHomeFacade facade = SmartHomeFacade(lightingControl,temperatureControl,equipmentControl);

    return """
// What does the smart home system do when you leave.
${facade.leave()}
    
// What does the smart home system do when you go back home.
${facade.homeBack()}
    """;
  }
}



class SmartHomeFacade {
  LightingControl lightingControl;
  TemperatureControl temperatureControl;
  EquipmentControl equipmentControl;

  SmartHomeFacade(this.lightingControl,this.temperatureControl,this.equipmentControl);

  String leave() => """
${lightingControl.close()}
${equipmentControl.closeWindows()}
${equipmentControl.closeDoors()}
//get out the car from the garage
${equipmentControl.openGarageDoor()}

    """;

  String homeBack() => """
${equipmentControl.openGarageDoor()}
${temperatureControl.getCurrentTemperature()}
${lightingControl.open()}
  """;
}



class LightingControl{
  open()=> makeSound() + ";Lighting : Opened";
  close()=> makeSound() + ";Lighting : Closed";
  String makeSound() => "Beep beep!";

}

class TemperatureControl{
  getCurrentTemperature() => "the temperature is...";
  setTemperature()=>"the temperature was changed";
}


class EquipmentControl{
  openWindows()=> "all windows : opened";
  closeWindows()=> "all windows : closed";
  openDoors()=> "all doors : opened";
  closeDoors()=> "all doors : closed";
  openGarageDoor()=> "Garage door : opened";
  closeGarageDoor()=> "Garage door : closed";
}