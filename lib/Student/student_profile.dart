import 'package:flutter/material.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  Widget textfield({required String hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body:
      Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      textfield(
                        hintText: 'Fatin Nadhirah binti Bujairimi',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textfield(
                        hintText: '17074885/2',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textfield(
                        hintText: 'wie180015@siswa.um.edu.my',
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                )
              ],
            ),
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(10),
                child: Text("Profile",
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                ),),),
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/user_student.png'),
                      ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 240, left: 145),
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        )
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blueAccent;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 150, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


// Column(
//
// children: [
// Card(
// child:
// Text("Username: $username"),
// ),
// Card(
// child:
// Text("Email: $myEmail"),
// )
// ]
// );