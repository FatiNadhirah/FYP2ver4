import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:umpds_test_sixedit/Admin/admin_dashboard.dart';
import 'package:umpds_test_sixedit/Admin/Category/Adaptability/level.dart';
import 'package:umpds_test_sixedit/Admin/Category/Communication/level.dart';
import 'package:umpds_test_sixedit/Admin/Category/Creativity/level.dart';
import 'package:umpds_test_sixedit/Admin/Category/Emotional_Intelligence/level.dart';
import 'package:umpds_test_sixedit/Admin/Category/Integrity/level.dart';
import 'package:umpds_test_sixedit/Admin/Category/Mindfulness/level.dart';
import 'package:umpds_test_sixedit/Admin/Category/Resilence/level.dart';
import 'package:umpds_test_sixedit/Admin/Category/Teamwork/level.dart';
import 'yearOnecategory/year1category.dart';
import 'yearTwocategory/year2category.dart';
import 'yearThreecategory/year3category.dart';

class YearFilter extends StatefulWidget {
  const YearFilter({Key? key}) : super(key: key);

  @override
  _YearFilterState createState() => _YearFilterState();
}

class _YearFilterState extends State<YearFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            size: 30.0,
            color: Colors.white,),
        ),
        title: Text('Year Filter',
          style: TextStyle(
            color: Colors.white,
          ),),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 20.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
        children: [

          //Year One
          Material( color: Colors.blue[200],
            elevation: 10.0,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(24.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //text
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => YearOne())); //Adaptability/level.dart
                            },
                            child: Text("One",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Year Two
          Material( color: Colors.blue[400],
            elevation: 10.0,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(24.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //text
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => YearTwo()));
                            },
                            child: Text("Two",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Personality Category
          Material( color: Colors.blue[600],
            elevation: 10.0,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(24.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //text
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => YearThree())); //to home.dart
                            },
                            child: Text("Three",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),


        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 70.0),
          StaggeredTile.extent(2, 70.0),
          StaggeredTile.extent(2, 70.0),
        ],
      ),
    );
  }
}
