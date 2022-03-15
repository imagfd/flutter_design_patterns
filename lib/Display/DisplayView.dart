import 'package:flutter/material.dart';
import '../structural/Bridge/1.dart' as firstB;
import '../structural/Bridge/2.dart' as secondB;
import '../structural/Bridge/3.dart' as thirdB;
import '../structural/Adapter/1.dart' as firstA;
import '../structural/Adapter/2.dart' as secondA;
import '../structural/FlyWeight/1.dart' as firstF;
import '../structural/FlyWeight/2.dart' as secondF;
import 'design_pattern.dart';
import 'CodeView.dart';
import 'TextScaleFactorBloc.dart';

class DisplayView extends StatefulWidget {
  DisplayView({required this.designPattern});

  final DesignPattern designPattern;

  @override
  State<DisplayView> createState() => _DisplayViewState();
}

class _DisplayViewState extends State<DisplayView> {
  int _index =0;
  late DesignPattern designPattern;


  @override
  void initState() {
    super.initState();
    designPattern = widget.designPattern;
    designPattern = designPattern_;

  }

  Widget build(BuildContext context) {
    final TextScaleFactorBloc bloc =
        BlocProvider.of<TextScaleFactorBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: ListTile(title:  Text(widget.designPattern.runtimeType.toString(),style: TextStyle(color: Colors.white),),subtitle: Text(designPattern.ipa ?? "",style: TextStyle(color: Colors.white,fontSize: 10),)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.zoom_out,
                color: Colors.white,
              ),
              onPressed: () => bloc.decreaseTextScale()),
          IconButton(
            icon: Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
            onPressed: () => bloc.increaseTextScale(),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 25,
                child: designPattern.topics!.length > 1 ? ListView.builder(
                    itemCount: designPattern.topics?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext _ ,int index){
                      return RaisedButton(onPressed: (){
                          setState(() {
                            _index=index;
                            designPattern = designPattern_;
                          });
                      },child: Text(designPattern.topics![index]),
                      color: _index == index ? Colors.lightBlueAccent:Colors.grey[300],);
                    }):Container(),
              ),
              _buildTitle("Code", context),
              Expanded(flex: 85, child: _buildCodeView()),
              SizedBox(
                height: 8,
              ),
              _buildTitle("Result", context),
              Expanded(flex: 15, child: _buildResultView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6
          //  .copyWith(color: Colors.teal, letterSpacing: 1),
      ),
    );
  }

  Widget _buildCodeView() {
    print("designPattern.sourceFilePath! ${designPattern.sourceFilePath!.replaceAll(".dart", "/")+(_index+1).toString()+".dart"}");
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.blue,
        )),
        padding: EdgeInsets.all(8.0),
        child: CodeView(filePath: designPattern.topics!.length==0 ?
        designPattern.sourceFilePath :designPattern.sourceFilePath!.replaceAll(".dart", "/")+(_index+1).toString()+".dart" ));
  }

  Widget _buildResultView() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.green,
      )),
      child: Scrollbar(
          child: SingleChildScrollView(
              child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0).copyWith(right: 8),
          child: Text(
            designPattern.testRun(),
            style: TextStyle(fontFamily: "monospace", fontSize: 12),
          ),
        ),
      ))),
    );
  }


  get designPattern_{
    String name;
    String filePath;
    List<String> topics;
    print("designPattern.runtimeType.toString() ${designPattern.runtimeType.toString()}");
    if(designPattern.runtimeType.toString() == "Bridge"){
      name = "UK  /brɪdʒ/ US  /brɪdʒ/";
      filePath ="lib/Structural/Bridge.dart";
      topics=["app Theme","shape color","remote device control"];
      switch(_index){
        case 0  :  return designPattern = firstB.Bridge(name,filePath,topics);
        break;
        case 1  :  return designPattern = secondB.Bridge(name,filePath,topics);
        break;
        case 2  :  return designPattern = thirdB.Bridge(name,filePath,topics);
        break;
      }
    }else if(designPattern.runtimeType.toString() == "Adapter"){
      name = "UK  /əˈdæp.tər/ US  /əˈdæp.tɚ/";
      filePath ="lib/Structural/Adapter.dart";
      topics=["products from the third part","client & bank"];
      switch(_index){
        case 0  :  return designPattern = firstA.Adapter(name,filePath,topics);
        break;
        case 1  :  return designPattern = secondA.Adapter(name,filePath,topics);
        break;
      }
    }else if(designPattern.runtimeType.toString() == "FlyWeight"){
      name = "UK  /ˈflaɪ.weɪt/ US  /ˈflaɪ.weɪt/";
      filePath ="lib/Structural/FlyWeight.dart";
      topics=["drawing cars","serving coffee"];
      switch(_index){
        case 0  :  return designPattern = firstF.FlyWeight(name,filePath,topics);
        break;
        case 1  :  return designPattern = secondF.FlyWeight(name,filePath,topics);
        break;
      }
    }else
      return designPattern;
  }
}
