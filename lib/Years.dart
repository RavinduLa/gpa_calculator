import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calc/Semester.dart';
import 'package:gpa_calc/ScreenArguments.dart';
import 'package:gpa_calc/main.dart';

class YearOnePage extends StatefulWidget
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
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: new Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Current Cumulative GPA:",style: TextStyle(fontSize: 20),),
                          Text("3.89",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Year 1 CGPA:",style: TextStyle(fontSize: 20),),
                          Text("4.00",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Credits available for year 1:",style: TextStyle(fontSize: 20),),
                          Text("15",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Year 1 Cumulative grade points:",style: TextStyle(fontSize: 20),),
                          Text("60",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      /*Text("Current Cumulative GPA: 3.89",style: TextStyle(fontSize: 20),),
                      Text("Year 1 CGPA: 4.00",style: TextStyle(fontSize: 20),),
                      Text("Credits available for year 1",style: TextStyle(fontSize: 20),),
                      Text("Year 1 Cumulative grade points",style: TextStyle(fontSize: 20),)*/
                    ],
                  ),
                ),
              ],
            ),


            Column(
              children: [
                Semester(1,1),  //first year then semester
                Semester(1,2),
                RaisedButton(
                    onPressed: ()
                  {
                    Navigator.of(context).pushNamed('/addNewModule',arguments: "Data passed from home");
                  },

                  child: Text("Test: go to add module in year 1"),

                )
              ],
            ),

          ],
        )
      ),
    );
  }
}

class Semester extends StatefulWidget
{
  int semesterNumber ,year;
  //final String semesterData;



  Semester(int year, int sem)
  {
    this.semesterNumber = sem;
    this.year = year;
  }
  @override
  State<StatefulWidget> createState() {
    return _Semester(semesterNumber,year);
  }

}

class _Semester extends State
{
  int semesterNumber=1, year=1;
  _Semester(int sem, int year)
  {
    this.semesterNumber = sem;
    this.year = year;
  }
  @override
  Widget build(BuildContext context) {
    print("Year: "+year.toString()+" semester: "+ semesterNumber.toString());
    return Center(
      child: Container(
        padding: EdgeInsets.all(12.0),

      child: Card(

        color: Colors.lightGreenAccent,
       child: new Container(

       padding: EdgeInsets.all(12.0),

        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Semester "+this.semesterNumber.toString(), style: TextStyle(fontSize: 30)),],
            ),
            Divider(height: 20,thickness: 2,color: Colors.blue,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("GPA: 4.0",style: TextStyle(fontSize: 20),),
                Text("Credits available form semster: 15",style: TextStyle(fontSize: 20),),
                Text("Grade points",style: TextStyle(fontSize: 20),),
              ],
            ),

            //Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.cyan,
                    onPressed: () {
                      Navigator.push(context
                          , MaterialPageRoute(
                              builder: (context) => SemesterView(year: year,semester: semesterNumber,)   ));
                    },

                  child: Container(
                    //decoration: const BoxDecoration(color: Colors.red),
                    //padding: EdgeInsets.all(0.0),
                    child: Text("View Semester",style: TextStyle(fontSize: 20),) ,
                  )


                )
              ],
            )


          ],

        ),
      ),
      ),
      )

    );
  }

}


class YearTwoPage extends StatefulWidget
{
  final String data;
  YearTwoPage({Key key,@required this.data}): super(key: key);
  //_YearOnePage createState()=> _YearOnePage();

  @override
  State<StatefulWidget> createState() {
    return _YearTwoPage();
  }
}
class _YearTwoPage extends State
{
  /*String datarec;

  _YearOnePage(String data)
  {
    this.datarec = data;
  }*/

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Year 2"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Current Cumulative GPA:",style: TextStyle(fontSize: 20),),
                            Text("3.89",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Year 1 CGPA:",style: TextStyle(fontSize: 20),),
                            Text("4.00",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Credits available for year 1:",style: TextStyle(fontSize: 20),),
                            Text("15",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Year 1 Cumulative grade points:",style: TextStyle(fontSize: 20),),
                            Text("60",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        /*Text("Current Cumulative GPA: 3.89",style: TextStyle(fontSize: 20),),
                      Text("Year 1 CGPA: 4.00",style: TextStyle(fontSize: 20),),
                      Text("Credits available for year 1",style: TextStyle(fontSize: 20),),
                      Text("Year 1 Cumulative grade points",style: TextStyle(fontSize: 20),)*/
                      ],
                    ),
                  ),
                ],
              ),


              Column(
                children: [
                  Semester(2,1),
                  Semester(2,2)
                ],
              ),

            ],
          )
      ),
    );
  }
}

class YearThreePage extends StatefulWidget
{
  final String data;
  YearThreePage({Key key,@required this.data}): super(key: key);
  //_YearOnePage createState()=> _YearOnePage();

  @override
  State<StatefulWidget> createState() {
    return _YearThreePage();
  }
}
class _YearThreePage extends State
{
  //String datarec;

  /*_YearOnePage(String data)
  {
    this.datarec = data;
  }
*/
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Year 3"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Current Cumulative GPA:",style: TextStyle(fontSize: 20),),
                            Text("3.89",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Year 1 CGPA:",style: TextStyle(fontSize: 20),),
                            Text("4.00",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Credits available for year 1:",style: TextStyle(fontSize: 20),),
                            Text("15",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Year 1 Cumulative grade points:",style: TextStyle(fontSize: 20),),
                            Text("60",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        /*Text("Current Cumulative GPA: 3.89",style: TextStyle(fontSize: 20),),
                      Text("Year 1 CGPA: 4.00",style: TextStyle(fontSize: 20),),
                      Text("Credits available for year 1",style: TextStyle(fontSize: 20),),
                      Text("Year 1 Cumulative grade points",style: TextStyle(fontSize: 20),)*/
                      ],
                    ),
                  ),
                ],
              ),


              Column(
                children: [
                  Semester(3,1),
                  Semester(3,2)
                ],
              ),

            ],
          )
      ),
    );
  }
}

class YearFourPage extends StatefulWidget
{
  final String data;
  YearFourPage({Key key,@required this.data}): super(key: key);
  //_YearOnePage createState()=> _YearOnePage();

  @override
  State<StatefulWidget> createState() {
    return _YearFourPage();
  }
}
class _YearFourPage extends State
{
  //String datarec;

  /*_YearOnePage(String data)
  {
    this.datarec = data;
  }
*/
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Year 4"),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Current Cumulative GPA:",style: TextStyle(fontSize: 20),),
                            Text("3.89",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Year 1 CGPA:",style: TextStyle(fontSize: 20),),
                            Text("4.00",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Credits available for year 1:",style: TextStyle(fontSize: 20),),
                            Text("15",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Year 1 Cumulative grade points:",style: TextStyle(fontSize: 20),),
                            Text("60",style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        /*Text("Current Cumulative GPA: 3.89",style: TextStyle(fontSize: 20),),
                      Text("Year 1 CGPA: 4.00",style: TextStyle(fontSize: 20),),
                      Text("Credits available for year 1",style: TextStyle(fontSize: 20),),
                      Text("Year 1 Cumulative grade points",style: TextStyle(fontSize: 20),)*/
                      ],
                    ),
                  ),
                ],
              ),


              Column(
                children: [
                  Semester(4,1),
                  Semester(4,2)
                ],
              ),

            ],
          )
      ),
    );
  }
}