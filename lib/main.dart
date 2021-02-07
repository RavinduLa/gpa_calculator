// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GPA Calculator'),
        ),
        body: Center(
          child: HomePage(),
        ),
      ),
    );


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
      return Container(

        padding: EdgeInsets.all(12),
        child: YearView(),
      );
  }

}

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