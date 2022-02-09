import 'package:flutter/material.dart';

class StudentTest extends StatefulWidget {
  const StudentTest({Key? key}) : super(key: key);

  @override
  _StudentTestState createState() => _StudentTestState();
}

class _StudentTestState extends State<StudentTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Personality Test',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            size: 30.0,
            color: Colors.white,),
        ),
      ),
      body: Column(

      ),
    );
  }
}
