import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz2 extends StatefulWidget {
  const Quiz2({Key? key}) : super(key: key);

  @override
  _Quiz2State createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Adaptability').snapshots();
  int _value = 1;
  int selectedValue = 0;
  int selectedRadio = 0;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back,
            size: 30.0,
            color: Colors.white,),
        ),
        title: Text("Quiz2")
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
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Wrap(children: [
                            Text(
                              snapshot.data!.docChanges[index].doc['question'],
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ]),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = 0;
                                  });
                                },
                                activeColor: Colors.blueAccent,
                                splashRadius: 12,
                                visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                                child: Text(
                                  'Agree',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = 2;
                                  });
                                },
                                activeColor: Colors.blueAccent,
                                splashRadius: 12,
                                visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                                child: Text(
                                  'Disagree',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),

        // RadioListTile(
        //     value: 2,
        //     groupValue: selectedValue,
        //     title: Text("Disgree"),
        //     onChanged: (value) => selectedValue = 2)


    );
  }


}



