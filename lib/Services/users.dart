import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umpds_test_sixedit/Student/student_profile2.dart';
import 'package:umpds_test_sixedit/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  storeNewUser(user, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .set({'email': user.email, 'uid': user.uid})
        .then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => Profile())))
        .catchError((e) {
      print(e);
    });
  }
}

class UserManagement2 {
  storeNewUser(user, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .set({'email': user.email, 'uid': user.uid, 'faculty':user.faculty, 'year':user.year})
        .then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudentProfile2())))
        .catchError((e) {
      print(e);
    });
  }
}


