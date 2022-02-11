import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ComNormal extends StatefulWidget {
  @override
  _ComNormalState createState() => _ComNormalState();
}

class _ComNormalState extends State<ComNormal> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('users').where("comLevel",isEqualTo: "Normal").where("faculty", isEqualTo: "Education").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            size: 30.0,
            color: Colors.white,),
        ),
        title: Text('Education > Normal Communication'),
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
                  //if tap on the list will go to the data index 
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) =>
                    //         UserDetails(docid: snapshot.data!.docs[index]),
                    //   ),
                    // );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['username'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                              snapshot.data!.docChanges[index].doc['department'] + "         Year " + snapshot.data!.docChanges[index].doc['year']
                          ),
                          trailing: Text(
                            (snapshot.data!.docChanges[index].doc['comScore']).toStringAsFixed(0) + "%",
                            style: TextStyle(
                                fontSize: 20
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