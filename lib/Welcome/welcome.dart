import 'package:flutter/material.dart';
import 'package:umpds_test_sixedit/Welcome/login_screen.dart';
import 'package:umpds_test_sixedit/Welcome/registration_screen.dart';

class welcome extends StatefulWidget {
  //const welcome({ Key? key }) : super(key: key);

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.5,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            Container(
              //double.infinity = big as parents allows
              width: double.infinity,
              //MediaQuery = big as per the screen
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                //even space distribution
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/univ_logo.png"))),
                  ),
                  Column(
                    children: [
                      Text("PERSONALITY ASSESSMENT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.bold,
                            fontSize: 35
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text ("WELCOME",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      //the login button
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())); //to login.dart
                        },
                        //defining the shape
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      //creating sign up button
                      SizedBox(height: 20),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen())); //to signup.dart
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],

                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
                //children
              ),
            ),

          ]//children
      ),
    );
  }
}
