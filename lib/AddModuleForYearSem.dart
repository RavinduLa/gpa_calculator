import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/Model/Module.dart';
import 'package:gpa_calc/db_helper.dart';
import 'package:gpa_calc/main.dart';
import 'package:gpa_calc/Years.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AddModuleForYearSem extends StatefulWidget
{
  final int year,semester;
  AddModuleForYearSem(this.year,this.semester);
  @override
  State<StatefulWidget> createState() {
    return _AddModuleForYearSem(year,semester);
  }

}

class _AddModuleForYearSem extends State
{
  String moduleCode;
  String moduleName;
  String grade;
  int credits;
  int year;
  int semester;

  _AddModuleForYearSem(int y, int s)
  {
    this.year = y;
    this.semester = s;
  }


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context)
  {
    return Scaffold(
      //resizing is done since bottom overflow was present when keyboards appear
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Add new Module"),),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Year:"+year.toString()),
                  Text("Semester: "+semester.toString()),
                  _buildModuleCodeField(),
                  _buildModuleNameField(),
                  _buildCreditsField(),
                  _buildGradeField(),
                  SizedBox(height: 100,),
                  RaisedButton(
                      child: Text("Add",style: TextStyle(color: Colors.blue, fontSize: 16),),
                      onPressed: ()  async
                      {
                        if(!_formKey.currentState.validate())
                        {
                          return;
                        }
                        _formKey.currentState.save();
                        print(moduleCode);

                        Module module = new Module(moduleCode, moduleName, grade, credits,year,semester);
                        await insertData2(module);
                        print("Called insertData2");

                      }
                  )
                ],
              ),

            ),
          ),
        )
    );
  }

  Future<void> insertData(Module module) async
  {
    print("Running insertData");
    WidgetsFlutterBinding.ensureInitialized();
    Future<String> databasePath = getDatabasesPath();
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'gpa_calc.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE module( moduleCode TEXT, moduleName TEXT,  grade TEXT, credits INTEGER, INTEGER year, "
              "INTEGER semester)",
        );
      },
      version: 1,
    );

    final Database db = await database;
    await db.insert('module', module.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("End of insertData");

  }

  Future<void> insertData2(Module module) async
  {
    DBHelper dbHelper = new DBHelper();
    dbHelper.db;
    dbHelper.insertModule(module);

    print("Running insertData2");

  }

  Widget _buildModuleCodeField()
  {
    return TextFormField(

      decoration: InputDecoration(
          labelText: "Module Code"
      ),
      // ignore: missing_return
      validator: (String value)
      {
        if(value.isEmpty)
        {
          return "Module code is required";
        }
        /* else{
          return null;
        }*/
      },
      onSaved: (String value)
      {
        moduleCode = value;
      },
    );
  }

  Widget _buildModuleNameField()
  {
    return TextFormField(

      decoration: InputDecoration(
          labelText: "Module Name"
      ),
      // ignore: missing_return
      validator: (String value)
      {
        if(value.isEmpty)
        {
          return "Module name is required";
        }
        /* else{
          return null;
        }*/
      },
      onSaved: (String value)
      {
        moduleName = value;
      },
    );
  }

  Widget _buildGradeField()
  {
    return DropdownButtonFormField<String>(
      //value: grade,
      hint: Text("Grade"),

      items: <String>['A+','A','A-','B+','B','B-','C+','C','C-','D+','D','E']
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
        print(grade);
      },
      validator: (grade )
      {
        if(grade ==null)
        {
          return "Please select a grade";
        }
        return null;
      },

    );
  }

  Widget _buildCreditsField()
  {
    return TextFormField(

      decoration: InputDecoration(
          labelText: "Credits available for the module"
      ),
      // ignore: missing_return
      keyboardType: TextInputType.number,
      validator: (String value)
      {
        int tempCredits = int.tryParse(value);
        if(tempCredits == null || tempCredits < 0)
        {
          return "Please enter a valid credit number";
        }
        return null;
      },
      onSaved: (String value)
      {
        int tempCredits2 = int.tryParse(value);
        credits = tempCredits2;
      },
    );
  }

  Widget _buildYearField()
  {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Year of the module"
      ),
      keyboardType: TextInputType.number,
      validator: (String value)
      {
        int tempYaer = int.tryParse(value);
        if(tempYaer == null || tempYaer < 1)
        {
          return "Please insert a valid year";
        }
        return null;
      },
      onSaved: (String value)
      {
        year = int.tryParse(value);
      },
    );
  }

  Widget _buildSemesterField()
  {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Semester of the module"
      ),
      keyboardType: TextInputType.number,
      validator: (String value)
      {
        int tempYaer = int.tryParse(value);
        if(tempYaer == null || tempYaer < 1)
        {
          return "Please insert a valid semester";
        }
        return null;
      },
      onSaved: (String value)
      {
        year = int.tryParse(value);
      },
    );
  }



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
