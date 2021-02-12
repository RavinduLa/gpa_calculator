import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/AddModule.dart';
import 'package:gpa_calc/ScreenArguments.dart';
import 'package:gpa_calc/Semester.dart';
import 'package:gpa_calc/main.dart';
import 'package:gpa_calc/Years.dart';
import 'package:gpa_calc/ModuleScreen.dart';

class RouteGenerator
{
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> HomePage());

      case '/year1':
        return MaterialPageRoute(builder:(_) => YearOnePage(data: args,));

      case '/year2':
        return MaterialPageRoute(builder: (_) => YearTwoPage(data: args));

      case '/year3':
        return MaterialPageRoute(builder: (_) => YearThreePage(data: args));

      case '/year4':
        return MaterialPageRoute(builder: (_) => YearFourPage(data: args));

      case '/addNewModule':
        return MaterialPageRoute(builder: (_) => AddModule());

      case '/semesterView':
        return MaterialPageRoute(builder: (_) => SemesterView());

      case '/addModule':
        return MaterialPageRoute(builder: (_) => AddModule());

      case '/moduleScreen':
        return MaterialPageRoute(builder: (_) => Module() );
      default: _errorRoute();
    }

  }

  static Route<dynamic> _errorRoute()
  {
    return MaterialPageRoute(
        builder: (_)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Center(
              child: Text("Error in routing", style: TextStyle(fontSize: 30),),
            ),
          );
        }
    );
  }
}