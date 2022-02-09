import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails extends StatefulWidget {
  DocumentSnapshot docid;
  UserDetails({required this.docid});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  late String uid;
  late String username;
  late String email;

  @override
  void initState() {
    uid = widget.docid.toString();
    super.initState();
  }

  late Query user = FirebaseFirestore.instance.collection("users").where("uid", isEqualTo: widget.docid);

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text("User id: " + uid),),
          Container(
            child: Text("username: " + username),),
          Container(
            child: Text("User id: " + email),),
        ],
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
