import 'package:flutter/material.dart';
import 'package:umpds_test_sixedit/Student/student_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'exisresult.dart';

class NewResult extends StatefulWidget {
  const NewResult({Key? key}) : super(key: key);


  @override
  State<NewResult> createState() => _NewResultState();
}


class _NewResultState extends State<NewResult> {

  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  String userid = "userid";
  String email = "email";
  int adapScore = 0;
  int comScore = 0;
  int creaScore = 0;
  int emoScore = 0;
  int integScore = 0;
  int mindScore = 0;
  int resiScore = 0;
  int teamScore = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Student_Dashboard()));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExistResult(nadapScore: adapScore,
                    ncomScore: comScore,
                    ncreaScore: creaScore,
                    nemoScore: emoScore,
                    nintegScore: integScore,
                    nmindScore: mindScore,
                    nresiScore: resiScore,
                    nteamScore: teamScore
                ),
              ),
            );
          },
          icon: Icon(Icons.arrow_back,
            size: 30.0,
            color: Colors.white,),
        ),
        title: Text("Current result"),
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
                                  Text((adapScore).toStringAsFixed(0)+ "%",
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
                                value: adapScore/100,
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
                                  Text((comScore).toStringAsFixed(0)+ "%",
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
                                value: comScore/100,
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
                                  Text((creaScore).toStringAsFixed(0)+ "%",
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
                                value: creaScore/100,
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
                                  Text((emoScore).toStringAsFixed(0)+ "%",
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
                                value: emoScore/100,
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
                                  Text((integScore).toStringAsFixed(0)+ "%",
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
                                value: integScore/100,
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
                                  Text((mindScore).toStringAsFixed(0)+ "%",
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
                                value: mindScore/100,
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
                                  Text((resiScore).toStringAsFixed(0)+ "%",
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
                                value: resiScore/100,
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
                                  Text((teamScore).toStringAsFixed(0)+ "%",
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
                                value: teamScore/100,
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
        adapScore = ds['adapScore'];
        comScore = ds['comScore'];
        creaScore = ds['creaScore'];
        emoScore = ds['emoScore'];
        integScore = ds['integScore'];
        mindScore = ds['mindScore'];
        resiScore = ds['resiScore'];
        teamScore = ds['teamScore'];
        print(userid);
        print(email);
      }).catchError((e) {
        print(e);
      });
  }
}



