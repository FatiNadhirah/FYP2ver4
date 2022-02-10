import 'package:flutter/material.dart';


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Student_Dashboard()));
              },
              icon: Icon(Icons.arrow_back,
                size: 30.0,
                color: Colors.white,),
            ),
            title: Text("Result")
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //adaptability
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding:EdgeInsets.fromLTRB(20, 10, 20, 10)
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("    Adaptability",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 240,
                        ),
                        Text("50%",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 380,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
              //communication
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("    Communication",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 210,
                        ),
                        Text("40%",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 380,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.4,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
              //creativity
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("    Creativity",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 262,
                        ),
                        Text("60%",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 380,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.6,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
              //emotional
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("    Emotional",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 257,
                        ),
                        Text("50%",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 380,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
              //integrity
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("    Integrity",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 270,
                        ),
                        Text("70%",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 380,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
              //mindfulness
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("    Mindfulness",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 238,
                        ),
                        Text("40%",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 380,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.4,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
              //resilience
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("    Resilience",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 255,
                        ),
                        Text("50%",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 380,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
              //teamwork
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("    Teamwork",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 257,
                        ),
                        Text("80%",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 380,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.8,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )

    );
  }
}
