import 'package:cloud_firestore/cloud_firestore.dart';
import 'addquestion.dart';
import 'package:flutter/material.dart';
import 'editquestion.dart';
import 'package:umpds_test_sixedit/Admin/question.dart';

class MindfulnessCat extends StatefulWidget {
  @override
  _MindfulnessCatState createState() => _MindfulnessCatState();
}

class _MindfulnessCatState extends State<MindfulnessCat> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('QuestionList').where("category",isEqualTo: "Mindfulness").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => addnote()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Category()));
          },
          icon: Icon(Icons.arrow_back,
            size: 30.0,
            color: Colors.white,),
        ),
        title: Text('Mindfulness'),
      ),
      body: StreamBuilder(
        stream: _usersStream,
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            editnote(docid: snapshot.data!.docs[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['question'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}