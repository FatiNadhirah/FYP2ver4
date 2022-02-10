import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:umpds_test_sixedit/Admin/admin_dashboard.dart';


class LoginScreenAdmin extends StatefulWidget {
  const LoginScreenAdmin({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenAdmin> {

  //form key
  final _formKey = GlobalKey<FormState>();

  //firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;


  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value)
      {
          if(value!.isEmpty)
            {
              return ("Please Enter Your Email");
            }

          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
      },
      onSaved: (value)
      {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "UmMail",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );


    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value)
      {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );



  //login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signIn(emailController.text, passwordController.text);
        },
        child: Text("Login", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            size: 30.0,
            color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/main_bottom.png",
                  width: size.width * 0.4,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("Admin Login",
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            Text("Please enter your UMMail account",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700]),)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Form(
                          key: _formKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                  emailField,
                                  SizedBox(height: 25),

                                  passwordField,
                                  SizedBox(height: 35),

                                  loginButton,
                                  SizedBox(height: 15),

                      ],
                    ),
                          ),
                        )
                  ],
                ),
              ),
            ]
          ),
        ),
        ]
    ),
      )
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Admin_Dashboard())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}



