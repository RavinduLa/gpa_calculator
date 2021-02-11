import 'dart:async';
//import 'dart:io' as io;
//import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Model/Module.dart';

class DBHelper
{
  static Database _db;
  static const String moduleCode = 'code';
  static const String moduleName = 'name';
  static const String grade = 'grade';
  static const int credits = 0;
  static const int year = 0;
  static const int semester = 0;


  static const String TABLE ='Module';
  static const String DB_NAME = 'gpa_db';

  Future<Database> get db async
  {
    if(_db != null)
      {
        print("Returning db instance");
        return _db;
      }
    else if (_db == null){
      print("Returning db instance");
      _db = await initDB();

      return _db;
    }

  }

  initDB() async
  {
    print("in initDB()");
    return await openDatabase(

        join(await getDatabasesPath(), 'gpa_calc.db'),
        onCreate: (db,version) async
        {
          return db.execute("CREATE TABLE module (moduleCode TEXT PRIMARY KEY, moduleName TEXT, grade TEXT, credits INTEGER, year INTEGER, "
              "semester INTEGER)");
          /*await db.execute(
              '''
            CREATE TABLE module(
            moduleCode TEXT PRIMARY KEY, moduleName TEXT, grade TEXT, credits INTEGER, year INTEGER, semester INTEGER, 
            )
            '''
          );*/


        },//onCreate
        version : 1

    );
  }
  Future<List<Module>> getAllRecordsForModule() async
  {
    print("in DBHelper getAllRecords");
    final Database db =  _db;
    final List<Map<String, dynamic>> maps = await db.query('module');
    
    return List.generate(maps.length, (i) {
      return Module(maps[i]['moduleCode'], maps[i]['moduleName'], maps[i]['grade'], maps[i]['credits'], maps[i]['year'], maps[i]['semester']);
    });


  }

  Future<void> insertModule(Module module) async
  {
    final Database db =  _db;
    
    await db.insert("module", module.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  newModule (newModule) async
  {
    print("in DBHelper newModule");
    final db =  _db;

    var res = await db.rawInsert('''INSERT INTO module VALUES (?,?,?,?,?,?)''',
        [newModule.moduleCode, newModule.moduleName, newModule.grade, newModule.credits, newModule.year, newModule.semster]);

    return res;
  }

}



