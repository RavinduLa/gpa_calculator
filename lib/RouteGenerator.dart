import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/main.dart';
import 'package:gpa_calc/Years.dart';

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