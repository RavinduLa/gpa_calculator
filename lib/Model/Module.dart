import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Module
{
  //final int id;
  /*final String moduleCode;
  final String moduleName;
  final String grade;
  final int credits;
  final int year;
  final int semester;*/

  String moduleCode;
  String moduleName;
  String grade;
  int credits;
  int year;
  int semester;




  Module(this.moduleCode, this.moduleName, this.grade, this.credits, this.year,
      this.semester);


  Map<String,dynamic> toMap()
  {
    return
        {
          //'id':id,
          'moduleCode' : moduleCode,
          'moduleName' : moduleName,
          'grade': grade,
          'credits' : credits,
          'year': year,
          'semester': semester,
        };
  }

  Module.fromMap(Map<String, dynamic> map)
  {
    moduleCode = map['moduleCode'];
    moduleName = map['moduleName'];
    grade  = map['grade'];
    credits = map['credits'];
    year = map['year'];
    semester = map['semester'];
  }

  String getModuleCode()
  {
    return this.moduleCode;
  }


}