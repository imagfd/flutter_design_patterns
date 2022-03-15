import 'package:flutter/material.dart';
import '../Structural/Facade.dart';
import '../structural/Adapter/1.dart';
import '../structural/Bridge/1.dart';
import '../structural/FlyWeight/1.dart';
import 'DisplayView.dart';
import 'TextScaleFactorBloc.dart';
import 'design_pattern.dart';
import 'package:flutter_design_patterns/Structural/Composite.dart';
import 'package:flutter_design_patterns/Structural/Decorator.dart';
import 'package:flutter_design_patterns/Structural/Proxy.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design Pattern Dart',
      home: MyHomePage(),
    );
  }
}

List list = <dynamic>[
  "Creational",
  /*SimpleFactory(),
  FactoryMethod(),
  AbstractFactory(),
  BuilderPattern.Builder(),
  Prototype(),
  Singleton(),*/
  "Structural",
  Adapter(),
  Bridge(),
  Composite(),
  Decorator(),
  Facade(),
  FlyWeight(),
  Proxy(),
  "Behavioral",
  /*ChainOfResponsibility(),
  Command(),
  Iterator(),
  Mediator(),
  Memento(),
  Observer(),
  Visitor(),
  Strategy(),
  StatePattern.State(),
  Template(),*/
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Design Pattern Dart"),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return (list[index] is String)
                  ? _buildHeader(list[index])
                  : _buildListContent(
                      content: list[index].runtimeType.toString(),
                      designPattern: list[index]);
            }));
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.layers,
            color: Colors.lightBlueAccent,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            softWrap: true,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  Widget _buildListContent({String? content, DesignPattern? designPattern}) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider<TextScaleFactorBloc>(
                bloc: TextScaleFactorBloc(),
                child: DisplayView(
                  designPattern: designPattern!,
                ),
              ))),
      title: Text(content!),
    );
  }
}
