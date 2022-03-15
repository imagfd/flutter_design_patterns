import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'SyntaxHighlighter.dart';
import 'TextScaleFactorBloc.dart';

class CodeView extends StatefulWidget {
  final String? filePath;

  CodeView({@required this.filePath});

  @override
  _CodeViewState createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
   late TextScaleFactorBloc bloc;

  @override
  void initState() {
    print("filePath ${widget.filePath}");
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(widget.filePath!,cache: false) ,
      builder: (context, snapshot) {
          if(snapshot.hasData)
            return Padding(
                padding: EdgeInsets.all(4.0),
                child: SingleChildScrollView(child: Text(snapshot.data as String)),
              );
            else
            return Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }



}
