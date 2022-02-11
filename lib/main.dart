import 'package:flutter/material.dart';
import 'package:umpds_test_sixedit/Welcome/welcome.dart';
import 'package:umpds_test_sixedit/Welcome/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:umpds_test_sixedit/Admin/admin_dashboard.dart';
import 'package:umpds_test_sixedit/Student/Quiz/quizadaptability.dart';
import 'package:umpds_test_sixedit/Admin/report.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const UMPDS());
}

class UMPDS extends StatelessWidget {
  const UMPDS({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UMPDS',
      theme: ThemeData(),
      home: welcome(), //at welcome.dart
      //home: Admin_Dashboard(),
      //home: LoginScreen(), //at welcome.dart
      //home: Wrapper(),
      //home: Question_CRUD(),
      //home: HomeScreen(), //at home.dart
      // home: Admin_Dashboard(),

    );
  }
}