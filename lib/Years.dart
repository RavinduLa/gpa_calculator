import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/main.dart';

class YearOnePage extends StatefulWidget
{
  final String data;
  YearOnePage({Key key,@required this.data}): super(key: key);
  //_YearOnePage createState()=> _YearOnePage();

  @override
  State<StatefulWidget> createState() {
    return _YearOnePage(data);
  }
}
class _YearOnePage extends State
{
  String datarec;

  _YearOnePage(String data)
  {
    this.datarec = data;
  }

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Year 1"),
      ),
      body: Center(
        child: Text("Year 1 details"+datarec),
      ),
    );
  }
}