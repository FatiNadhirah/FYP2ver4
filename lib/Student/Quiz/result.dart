import 'package:flutter/material.dart';
import 'package:umpds_test_sixedit/Student/student_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Result extends StatefulWidget {
  final int teamLength;
  final int teamMarks;
  final int resiLength;
  final int resiMarks;
  final int mindLength;
  final int mindMarks;
  final int integLength;
  final int integMarks;
  final int emoLength;
  final int emoMarks;
  final int creaLength;
  final int creaMarks;
  final int comLength;
  final int comMarks;
  final int adapLength;
  final int adapMarks;
  const Result({Key? key, required this.teamLength, required this.teamMarks,
                          required this.resiLength, required this.resiMarks,
                          required this.mindLength,required this.mindMarks,
                          required this.integLength,required this.integMarks,
                          required this.emoLength,required this.emoMarks,
                          required this.creaLength,required this.creaMarks,
                          required this.comLength,required this.comMarks,
                          required this.adapLength,required this.adapMarks}) : super(key: key);


  @override
  State<Result> createState() => _ResultState();
}


class _ResultState extends State<Result> {

  String userid = "userid";
  String email = "email";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Student_Dashboard()));

          },
          icon: Icon(Icons.arrow_back,
            size: 30.0,
            color: Colors.white,),
        ),
        title: Text("Your result"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future:  _fetch(),
            builder: (context, snapshot){
              if(snapshot.connectionState != ConnectionState.done)
                return Text("Loading data..  Please wait");
              return Column(
                  children : [

                    //adaptability
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding:EdgeInsets.fromLTRB(20, 10, 20, 10)
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Adaptability",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   width: 215,
                                // ),
                                Text((widget.adapMarks / (widget.adapLength*10)*100).toStringAsFixed(0)+ "%",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 380,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: widget.adapMarks / (widget.adapLength*10),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[400],
                            ),
                          ),
                        )
                      ],
                    ),

                    //communication
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Communication",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   width: 185,
                                // ),
                                Text((widget.comMarks / (widget.comLength*10)*100).toStringAsFixed(0)+ "%",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 380,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: widget.comMarks / (widget.comLength*10),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[400],
                            ),
                          ),
                        )
                      ],
                    ),

                    //creativity
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Creativity",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   width: 227,
                                // ),
                                Text((widget.creaMarks / (widget.creaLength*10)*100).toStringAsFixed(0)+ "%",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 380,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: widget.creaMarks / (widget.creaLength*10),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[400],
                            ),
                          ),
                        )
                      ],
                    ),

                    //emotional
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Emotional",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   width: 232,
                                // ),
                                Text((widget.emoMarks / (widget.emoLength*10)*100).toStringAsFixed(0)+ "%",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 380,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: widget.emoMarks / (widget.emoLength*10),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[400],
                            ),
                          ),
                        )
                      ],
                    ),

                    //integrity
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Integrity",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   width: 245,
                                // ),
                                Text((widget.integMarks / (widget.integLength*10)*100).toStringAsFixed(0)+ "%",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 380,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: widget.integMarks / (widget.integLength*10),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[400],
                            ),
                          ),
                        )
                      ],
                    ),

                    //mindfulness
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Mindfulness",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   width: 213,
                                // ),
                                Text((widget.mindMarks / (widget.mindLength*10)*100).toStringAsFixed(0)+ "%",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 380,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: widget.mindMarks / (widget.mindLength*10),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[400],
                            ),
                          ),
                        )
                      ],
                    ),

                    //resilience
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Resilience",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   width: 230,
                                // ),
                                Text((widget.resiMarks / (widget.resiLength*10)*100).toStringAsFixed(0)+ "%",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 380,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: widget.resiMarks / (widget.resiLength*10),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[400],
                            ),
                          ),
                        )
                      ],
                    ),

                    //teamwork
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Teamwork",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   width: 232,
                                // ),
                                Text((widget.teamMarks / (widget.teamLength*10)*100).toStringAsFixed(0)+ "%",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 380,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: widget.teamMarks / (widget.teamLength*10),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[400],
                            ),
                          ),
                        )
                      ],
                    ),

                  ]
              );
            }
        )
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid)
          .get().then((DocumentSnapshot ds) {
        userid = ds['uid'];
        email = ds['email'];
        print(userid);
        print(email);
      }).catchError((e) {
        print(e);
      });
  }
}



