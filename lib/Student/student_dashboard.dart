import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:umpds_test_sixedit/Welcome/welcome.dart';
import 'package:umpds_test_sixedit/Student/student_result.dart';
import 'package:umpds_test_sixedit/Student/Quiz/quizadaptability.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umpds_test_sixedit/Student/Quiz/result.dart';
import 'newresult.dart';
import 'student_profile2.dart';
import 'package:umpds_test_sixedit/profile.dart';


class Student_Dashboard extends StatefulWidget {
  const Student_Dashboard({Key? key}) : super(key: key);

  @override
  _Student_DashboardState createState() => _Student_DashboardState();
}

class _Student_DashboardState extends State<Student_Dashboard> {

  String currentUser = "User";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        centerTitle: false,
        leadingWidth: 10,
        backgroundColor: Colors.blueAccent,
        title: Text('Student Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 0.1),
            child:  MaterialButton(
              onPressed: () => {
                openDialogueBox(context)
              },
              child: Icon(Icons.logout,
                    size: 25.0,
                    color: Colors.white,)
              ),
            )
        ],
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 20.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
        children: [

          //Profile
          Material( color: Colors.grey[200],
            elevation: 10.0,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(24.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //image
                        Material(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/user_student.png',
                              fit: BoxFit.contain,
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                        ),

                        //text
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile())); //to student_profile2.dart
                            },
                            child: Text("Profile",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
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

          //Question
          Material( color: Colors.grey[200],
            elevation: 10.0,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(24.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //image
                        Material(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/test.png',
                              fit: BoxFit.contain,
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                        ),

                        //text
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => quizAdap()));
                            },
                            child: Text("Personality Test",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
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

          //Report
          Material( color: Colors.grey[200],
            elevation: 10.0,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(24.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //image
                        Material(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/result.png',
                              fit: BoxFit.contain,
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                        ),

                        //text
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NewResult())); //to home.dart
                            },
                            child: Text("Test Result",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
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
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(1, 200.0),
          StaggeredTile.extent(1, 200.0),
        ],
      ),
    );
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Are you sure? '),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => welcome()));
                },
                child: Text("Log out",
                  style: TextStyle(
                    color: Colors.red,
                  ),),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text('Cancel'),)
            ],
          );
        });

  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid)
          .get().then((DocumentSnapshot ds) {
        currentUser = ds['uid'];
        print(currentUser);
      }).catchError((e) {
        print(e);
      });
  }

}

