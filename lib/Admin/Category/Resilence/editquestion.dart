import 'package:cloud_firestore/cloud_firestore.dart';
import 'managequestion.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({required this.docid});

  @override
  _editnoteState createState() => _editnoteState();
}

class _editnoteState extends State<editnote> {
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('question'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'question': title.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ResilienceCat()));
              });
            },
            child: Text("Save",
              style: TextStyle(
                color: Colors.white,
              ),),
          ),
          MaterialButton(
            onPressed: () {
              openDialogueBox(context);
            },
            child: Text("Delete",
              style: TextStyle(
                color: Colors.red,
              ),),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'question',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Delete question? '),
            actions: [
              MaterialButton(
                onPressed: () {
                  widget.docid.reference.delete().whenComplete(() {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => ResilienceCat()));
                  });
                  showToastMessage("Question deleted");
                },
                child: Text("Delete",
                  style: TextStyle(
                    color: Colors.red,
                  ),),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text('Cancel'),)
            ],
          );
        });

  }

  void showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_LONG, //duration for message to show
        gravity: ToastGravity.CENTER, //where you want to show, top, bottom
        timeInSecForIosWeb: 1, //for iOS only
        //backgroundColor: Colors.red, //background Color for message
        textColor: Colors.white, //message text color
        fontSize: 16.0 //message font size
    );
  }
}