import 'package:flutter_design_patterns/Display/design_pattern.dart';


class Bridge extends DesignPattern {
  Bridge([name,sourceFilePath,topics]) : super(name,sourceFilePath,topics);

  @override
  String testRun() {
    IDevice iDevice = new TV();
    SunsungRemoteControl sunsungRemoteControl =  SunsungRemoteControl(iDevice);



    return """       
    ${ sunsungRemoteControl.iDevice!.on()}
    ${ sunsungRemoteControl.setChannel(100)}
    """;
  }
}

//implementator
abstract class IDevice {
   String on();
   String off();
   String switchChannel(int channel);
}

//concrete implementor A
class TV implements IDevice{
  @override
  String off() =>"TV is turned off.";

  @override
  String on() =>"TV is turned on.";

  @override
  String switchChannel(int channel) =>"Samsung: channel - $channel";

}
//concrete implementor B
class Radio implements IDevice{
  @override
  String off() =>"Radio is turned off.";

  @override
  String on() =>"Radio is turned on.";

  @override
  String switchChannel(int channel) =>"Radio: channel - $channel";

}

//abstraction
abstract class RemoteControl {

  IDevice? iDevice;

  RemoteControl(this.iDevice);

  String turnOn() => iDevice!.on();

  String turnOff() => iDevice!.off();

  String setChannel(int channel) => iDevice!.switchChannel(channel);

}


class SunsungRemoteControl extends RemoteControl {

  SunsungRemoteControl(IDevice iDevice) : super(iDevice);

}

//("Sunsung use keyword to set channel.")