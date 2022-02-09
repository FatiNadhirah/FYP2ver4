import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';
import 'package:umpds_test_sixedit/Student/student_dashboard.dart';
import 'quizresilience.dart';
import 'result.dart';
import 'package:umpds_test_sixedit/Shared/loading.dart';
import 'allmarks.dart';
import 'package:umpds_test_sixedit/Services/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class quizTeam extends StatefulWidget {
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
  const quizTeam({Key? key, required this.resiLength, required this.resiMarks,
                            required this.mindLength,required this.mindMarks,
                            required this.integLength,required this.integMarks,
                            required this.emoLength,required this.emoMarks,
                            required this.creaLength,required this.creaMarks,
                            required this.comLength,required this.comMarks,
                            required this.adapLength,required this.adapMarks}) : super(key: key);

  @override
  _quizTeamState createState() => _quizTeamState();
}

class _quizTeamState extends State<quizTeam> {

  final Stream<QuerySnapshot> _usersStream1 = FirebaseFirestore.instance.collection('QuestionList').where("category",isEqualTo: "Teamwork").snapshots();

  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  int _value = -5;
  int selectedValue = 0;
  int selectedRadio = 0;
  int teamMarks = 0;
  int teamLength = 0;
  String answer = "";
  int noQuestion = 0;
  List<String> answer1 = ["No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer","No answer"];
  int currentIndex = 0;
  int limitMark = 0;
  String currentAnswer = "";

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: Text(""),
          // leading: IconButton(
          //   onPressed: (){
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => Student_Dashboard()));
          //   },
          //   icon: Icon(Icons.arrow_back,
          //     size: 30.0,
          //     color: Colors.white,),
          // ),
          title: Text("Personality Test")
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey[100],
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: ()=> Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.leftToRightJoined,
                      childCurrent: widget,
                      duration: Duration(milliseconds: 600),
                      reverseDuration: Duration(milliseconds: 600),
                      child: quizResi(mindMarks: widget.mindMarks, mindLength: widget.mindLength,
                                      integMarks: widget.integMarks, integLength: widget.integLength,
                                      emoMarks: widget.emoMarks, emoLength: widget.emoLength,
                                      creaMarks: widget.creaMarks, creaLength: widget.creaLength,
                                      comMarks: widget.comMarks, comLength: widget.comLength,
                                      adapMarks: widget.adapMarks,adapLength: widget.adapLength,),
                    )),
                    icon: Icon(Icons.arrow_back_ios,
                      size: 20.0,),
                  ),
                ),
                Expanded(
                  child: Text('Teamwork',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),),
                ),
                Expanded(
                  child: Text('', textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _usersStream1,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("something is wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Wrap(children: [
                                  Text("Question " + (index+1).toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,),
                                  Text(
                                    snapshot.data!.docChanges[index].doc['question'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ]),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: index+10,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = index+10-index;
                                          // comMarks += _value;
                                          value = _value;
                                          answer = "Agree";
                                          noQuestion = index +1;
                                          currentIndex = index;
                                          teamLength = snapshot.data!.docs.length;

                                          if(answer1.length==1){
                                            for(int i=0 ; i <snapshot.data!.docs.length;i++)
                                              answer1.add(" ");

                                          }
                                          if(answer1[currentIndex].contains(" ")){
                                            answer1.removeAt(currentIndex);
                                            answer1.insert(currentIndex, "Agree");
                                            teamMarks += _value;

                                          } else {
                                            if(answer1[currentIndex].contains("Disagree")){
                                              teamMarks += _value;
                                            }
                                            answer1.removeAt(currentIndex);
                                            answer1.insert(currentIndex, "Agree");

                                          }



                                          // answer1.add(answer);
                                        });
                                      },
                                      activeColor: Colors.blueAccent,
                                      splashRadius: 12,
                                      visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                                      child: Text(
                                        'Agree',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: index,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = index-index;
                                          value = _value;
                                          answer = "Disagree";
                                          noQuestion = index +1;
                                          currentIndex = index;
                                          teamLength = snapshot.data!.docs.length;

                                          if(answer1.length==1){
                                            for(int i=0 ; i <snapshot.data!.docs.length;i++)
                                              answer1.add(" ");
                                          }
                                          if(answer1[currentIndex].contains(" ")){
                                            answer1.removeAt(currentIndex);
                                            answer1.insert(currentIndex, "Disagree");
                                          } else {
                                            if(answer1[currentIndex].contains("Agree")){
                                              teamMarks = teamMarks - 10;
                                            }
                                            answer1.removeAt(currentIndex);
                                            answer1.insert(currentIndex, "Disagree");
                                          }
                                          // answer1.add(answer);
                                        });

                                      },
                                      activeColor: Colors.blueAccent,
                                      splashRadius: 12,
                                      visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                                      child: Text(
                                        'Disagree',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                                Text("Question " + (index+1).toString() + " : "+ (answer1.getRange(index, index+1)).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          // Container(
          //   height: 40,
          //   color: Colors.lightGreen,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text("Answer:  $answer1" ,
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //             fontStyle: FontStyle.italic,
          //             backgroundColor: Colors.lightGreen
          //         ),),
          //     ],
          //   ),
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Loading()));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Result(teamMarks: teamMarks, teamLength: teamLength,
                                                                                          resiMarks: widget.resiMarks, resiLength: widget.resiLength,
                                                                                          mindMarks: widget.mindMarks, mindLength: widget.mindLength,
                                                                                          integMarks: widget.integMarks, integLength: widget.integLength,
                                                                                          emoMarks: widget.emoMarks, emoLength: widget.emoLength,
                                                                                          creaMarks: widget.creaMarks, creaLength: widget.creaLength,
                                                                                          comMarks: widget.comMarks, comLength: widget.comLength,
                                                                                          adapMarks: widget.adapMarks,adapLength: widget.adapLength,)));
                  firestoreInstance.collection("users").doc(firebaseUser?.uid).set(
                      {
                        "teamScore" : teamMarks/(teamLength*10)*100,
                        if(teamMarks/(teamLength*10)*100 > 50)
                          "teamLevel" : "High",
                        if(teamMarks/(teamLength*10)*100 < 50)
                          "teamLevel" : "Low",
                        if(teamMarks/(teamLength*10)*100 == 50)
                          "teamLevel" : "Normal",
                      },SetOptions(merge: true)).then((_){
                    print("success!");
                  });

                },
                child: Text("Submit",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                  ),),
              ),
            ],
          )
        ],
      ),
    );
  }


}



