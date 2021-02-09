import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/main.dart';
import 'package:gpa_calc/Years.dart';

class AddModule extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _AddModule();
  }

}

class _AddModule extends State
{
  String moduleCode;
  String moduleName;

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Add new Module"),),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text("Module Code"),
                      moduleCodeInputField()
                    ],
                  ),
                )

              ),

              Card(
              child: Container(
                padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text("Module Name"),
                      moduleNameInputField()
                    ],
                  ),
                )
              ),

              Card(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text("Grade for the module"),
                      buildGradeList()
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [Text("test")],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget moduleCodeInputField()
  {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter the module code here"
      ),
    );
  }

  Widget moduleNameInputField()
  {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Enter the module name here"
      ),
    );
  }


  String grade;
  Widget buildGradeList()
  {
    return DropdownButton(
        items: <String>['A+','A','A-','B+','B']
        .map<DropdownMenuItem<String>>((String value)
        {
          return DropdownMenuItem<String>(
            value: value,
              child: Text(value));
        }).toList(),
        onChanged: (String newGrade)
        {
          setState(() {
            grade = newGrade;
          });
        }
    );
  }
}
