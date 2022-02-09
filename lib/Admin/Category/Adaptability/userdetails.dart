import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails extends StatefulWidget {
  DocumentSnapshot docid;
  UserDetails({required this.docid});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  late Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('QuestionList').where("uid",isEqualTo: widget.docid).snapshots();

  late String uid;
  late String username;
  late String email;

  @override
  void initState() {
    uid = widget.docid.toString();
    super.initState();
  }

  // late Query user = FirebaseFirestore.instance.collection("users").where("uid", isEqualTo: widget.docid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text("User Details"),
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
                return Container(
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
                        child: Column(
                          children: [
                            Text("Username" +
                                snapshot.data!.docChanges[index].doc['username'],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                        Text("Email" +
                            snapshot.data!.docChanges[index].doc['email'],
                          style: TextStyle(
                            fontSize: 20,
                          ),),
                          ],
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

  _fetch() async {
    final CollectionReference ref = await FirebaseFirestore.instance.collection("users");
    if (ref != null)
      await FirebaseFirestore.instance.collection('users').doc(uid)
          .get().then((DocumentSnapshot ds) {
        username = ds['username'];
        email = ds['email'];
        print(username);
        print(email);
      }).catchError((e) {
        print(e);
      });
  }
}
