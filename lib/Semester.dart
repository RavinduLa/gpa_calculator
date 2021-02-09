import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/main.dart';

class SemesterView extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _SemesterView();
  }

}

class _SemesterView extends State
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Semster module list"),),

      body: Center(
        child: new Container(
          child: _moduleTile("IT2050", "SE", "A"),
        ),
      ),
    );
  }
}

ListTile _moduleTile(String mCode, String mName, String grade)
{
  return ListTile(
    title: Text(mCode),
    subtitle: Text(mName + grade  , style: TextStyle(fontSize: 12),),

    isThreeLine: true,
    trailing: IconButton(icon: Icon(Icons.edit),onPressed: null,),
  );
}
