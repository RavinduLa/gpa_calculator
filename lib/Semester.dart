import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/AddModule.dart';
import 'package:gpa_calc/AddModuleForYearSem.dart';
import 'package:gpa_calc/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gpa_calc/Model/Module.dart';
import 'package:gpa_calc/db_helper.dart';

import 'ScreenArguments.dart';


// ignore: must_be_immutable
class SemesterView extends StatefulWidget
{
  final year, semester;

  const SemesterView({Key key, this.year, this.semester}) : super(key: key);
  //const SemesterView({Key key, this.year, this.semester}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _SemesterView(year,semester);
  }

}

class _SemesterView extends State
{

  Map data= {};

  final year, semester;
  //Future<List<Module>> allRecords = new DBHelper().getAllRecordsForModule();

  _SemesterView(this.year, this.semester);
  //Future<List<Module>> moduleListFuture = db.getAllRecords();

  //List<Module> moduleList = new List<Module>();
  Widget build(BuildContext context)
  {
    data = ModalRoute.of(context).settings.arguments;
    /*year = data['year'];
    semester = data['semester'];*/

    /*final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    year = int.tryParse(args.year);
    semester = int.tryParse(args.semester);*/
    return Scaffold(
      appBar: AppBar(title: Text("Year $year semester $semester module list"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //Navigator.of(context).pushNamed('/addNewModule',arguments: "Data passed from home");
          Navigator.of(context).push(MaterialPageRoute(builder: (_) =>AddModuleForYearSem(year, semester)));
        },
      ),

      body: FutureBuilder<List>(
        //future: allRecords,
        future: getModulesForSemester(),
        initialData: List(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData) {

              print("snapshot has data");
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (_,int position){
                  //String mCode = snapshot.data[position];
                  //final item = snapshot.data[position];
                  return Card(
                    /*child: ListTile(

                      //title: Text("Module Code:"+item.toString()),
                    ),*/

                    child: _moduleTile2(snapshot.data[position]),
                  );

                  }
                  );

            }
          else{
            return Center(
              child: Text("No records to display"),
            );
          }

        },

      )
    );
  }

  /*Future<List<Module>> getAllModules() async
  {
    DBHelper dbHelper = new DBHelper();
    return dbHelper.getAllRecordsForModule();
  }*/

  //returns a future list for the year and semester
  Future<List<Module>> getModulesForSemester() async
  {
    DBHelper dbHelper = new DBHelper();
    return dbHelper.getAllRecordsForModule();
    //return dbHelper.getModulesForSemesterOfYear(year, semester);
  }


  /*void createModuleList() async
  {
    moduleList = await getModules();
  }*/

  Future<List<Module>> getModules() async
  {
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
    final List<Map<String, dynamic>> maps = await db.query('module');

    return List.generate(maps.length, (i) {
      return Module(
        maps[i]['moduleCode'],
      maps[i]['moduleName'],
      maps[i]['grade'],
      maps[i]['credits'],
      maps[i]['year'],
      maps[i]['semester'],);
    });



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

ListTile _moduleTile2(Module module)
{
  print("in moduleTile2");
  return ListTile(
    title: Text(module.moduleCode),
    subtitle: Text(module.moduleName + module.grade  , style: TextStyle(fontSize: 12),),

    onTap: null,
    isThreeLine: true,
    trailing: IconButton(icon: Icon(Icons.edit),onPressed: null,),
  );
}


