// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpa_calc/RouteGenerator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      //{(RouteSettings) -> Route<dynamic> onGenerateRoute}
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,

    );
      //{

      //},
      /*home: Scaffold(
        appBar: AppBar(
          title: Text('GPA Calculator'),
        ),
        body: Center(
          child: HomePage(),
        ),
      ),
    );*/


  }
}

class HomePage extends StatefulWidget
{
  @override
  _HomePage createState() => _HomePage();

}

class _HomePage extends State
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("GPA Calculator"),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(20),
            //child: YearView(),
            child: new Column(
            children: [GPAview(), YearView()],
        ),
      ),
    ),
    );

      /*return Container(
        padding: EdgeInsets.all(20),
        //child: YearView(),
        child: new Column(
          children: [GPAview(), YearView()],
        ),
      );*/
  }

}

class GPAview extends StatefulWidget
{
  _GPAview createState() => _GPAview();
}

class _GPAview extends State
{
  Widget build(BuildContext context)
  {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Text("Current CGPA: 3.78",style: TextStyle(fontSize: 30),),
      ),

    );
  }
}

/*class YearOnePage extends StatefulWidget
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
}*/

class YearView extends StatefulWidget
{
  @override
  _YearView createState() => _YearView();
}

class _YearView extends State
{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          new Ink(
            height : 150,

            child: new Card(
              color: Colors.cyan,

              child: InkWell(
                splashColor: Colors.black.withAlpha(30),
                onTap: () {
                  print('Card Year 1 tapped.');
                  /*Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Card Year 1 tapped"),
                  ));*/

                  Navigator.of(context).pushNamed('/year1',arguments: "Data passed from home");

                  Fluttertoast.showToast(
                      msg: "Year 1",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                child: Container(

                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Year 1 ",style: TextStyle(fontSize: 32),),],
                  ),
                  //child: Text("Year 1 ",style: TextStyle(fontSize: 32),),
                ),
              ),
            ),

          ),

          new Ink(
            height : 150,

            child: new Card(
              color: Colors.green,

              child: InkWell(
                splashColor: Colors.black.withAlpha(30),
                onTap: () {
                  print('Card Year 2 tapped.');

                  Navigator.of(context).pushNamed('/year2',arguments: "Data passed from home");

                  Fluttertoast.showToast(
                      msg: "Year 2",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                child: Container(

                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Year 2",style: TextStyle(fontSize: 32),),],
                  ),
                  //child: Text("Year 1 ",style: TextStyle(fontSize: 32),),
                ),
              ),
            ),

          ),
          new Ink(
            height : 150,

            child: new Card(
              color: Colors.blue,

              child: InkWell(
                splashColor: Colors.black.withAlpha(30),
                onTap: () {
                  print('Card Year 3 tapped.');
                  Navigator.of(context).pushNamed('/year3',arguments: "Data passed from home");
                  Fluttertoast.showToast(
                      msg: "Year 3",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                child: Container(

                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Year 3 ",style: TextStyle(fontSize: 32),),],
                  ),
                  //child: Text("Year 1 ",style: TextStyle(fontSize: 32),),
                ),
              ),
            ),

          ),
          new Ink(
            height : 150,

            child: new Card(
              color: Colors.red,

              child: InkWell(
                splashColor: Colors.black.withAlpha(30),
                onTap: () {
                  print('Card Year 4 tapped.');
                  Navigator.of(context).pushNamed('/year4',arguments: "Data passed from home");
                  Fluttertoast.showToast(
                      msg: "Year 4",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                child: Container(

                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Year 4",style: TextStyle(fontSize: 32),),],
                  ),
                  //child: Text("Year 1 ",style: TextStyle(fontSize: 32),),
                ),
              ),
            ),

          ),



        ],

      ),
    );
  }

}