import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'facultyDentistrycategory/dentristrycategory.dart';
import 'facultyEngineeringcategory/engineeringcategory.dart';
import 'facultyFSKTMcategory/FSKTMcategory.dart';
import 'facultyEducationcategory/Educationcategory.dart';
import 'facultyLanguagecategory/Languagecategory.dart';
import 'facultySciencecategory/Sciencecategory.dart';

class FacultyFilter extends StatefulWidget {
  const FacultyFilter({Key? key}) : super(key: key);

  @override
  _FacultyFilterState createState() => _FacultyFilterState();
}

class _FacultyFilterState extends State<FacultyFilter> {
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
        title: Text('Faculty Filter',
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

          //Dentistry
          Material( color: Colors.red[300],
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Dentistry())); //Adaptability/level.dart
                            },
                            child: Text("Dentistry",
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

          //Engineering
          Material( color: Colors.deepOrange[300],
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Engineering()));
                            },
                            child: Text("Engineering",
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

          //FSKTM
          Material( color: Colors.deepPurple[300],
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FSKTM())); //to home.dart
                            },
                            child: Text("FSKTM",
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

          //Education
          Material( color: Colors.grey[300],
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Education())); //Adaptability/level.dart
                            },
                            child: Text("Education",
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

          //Language
          Material( color: Colors.cyan[300],
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Language())); //Adaptability/level.dart
                            },
                            child: Text("Language",
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

          //Science
          Material( color: Colors.amber[300],
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Science())); //Adaptability/level.dart
                            },
                            child: Text("Science",
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


        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 70.0),
          StaggeredTile.extent(2, 70.0),
          StaggeredTile.extent(2, 70.0),
          StaggeredTile.extent(2, 70.0),
          StaggeredTile.extent(2, 70.0),
          StaggeredTile.extent(2, 70.0),
        ],
      ),
    );
  }
}

