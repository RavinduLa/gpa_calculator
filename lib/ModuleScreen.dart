import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/Semester.dart';

class Module extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _Module();
  }

}

class _Module extends State
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Module"),),

      body: Center(
        child: Container(
          child: Text("Test: in Module"),
        ),
      ),
    );
  }

}