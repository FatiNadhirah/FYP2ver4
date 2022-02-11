import 'package:flutter/material.dart';
import 'package:umpds_test_sixedit/Student/student_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExistResult extends StatefulWidget {
  final double nadapScore;
  final double ncomScore;
  final double ncreaScore;
  final double nemoScore;
  final double nintegScore;
  final double nmindScore;
  final double nresiScore;
  final double nteamScore;
  const ExistResult({Key? key, required this.nadapScore,
                              required this.ncomScore,
                              required this.ncreaScore,
                              required this.nemoScore,
                              required this.nintegScore,
                              required this.nmindScore,
                              required this.nresiScore,
                              required this.nteamScore}) : super(key: key);

  @override
  State<ExistResult> createState() => _ExistResultState();
}


class _ExistResultState extends State<ExistResult> {

  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

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
                                  Text((widget.nadapScore).toStringAsFixed(0)+ "%",
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
                                value: widget.nadapScore/100,
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
                                  Text((widget.ncomScore).toStringAsFixed(0)+ "%",
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
                                value: widget.ncomScore/100,
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
                                  Text((widget.ncreaScore).toStringAsFixed(0)+ "%",
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
                                value: widget.ncreaScore/100,
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
                                  Text((widget.nemoScore).toStringAsFixed(0)+ "%",
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
                                value: widget.nemoScore/100,
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
                                  Text((widget.nintegScore).toStringAsFixed(0)+ "%",
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
                                value: widget.nintegScore/100,
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
                                  Text((widget.nmindScore).toStringAsFixed(0)+ "%",
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
                                value: widget.nmindScore/100,
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
                                  Text((widget.nresiScore).toStringAsFixed(0)+ "%",
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
                                value: widget.nresiScore/100,
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
                                  Text((widget.nteamScore).toStringAsFixed(0)+ "%",
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
                                value: widget.nteamScore/100,
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
        // adapScore = ds['adapScore'];
        // comScore = ds['comScore'];
        // creaScore = ds['creaScore'];
        // emoScore = ds['emoScore'];
        // integScore = ds['integScore'];
        // mindScore = ds['mindScore'];
        // resiScore = ds['resiScore'];
        // teamScore = ds['teamScore'];
        print(userid);
        print(email);
      }).catchError((e) {
        print(e);
      });
  }
}



