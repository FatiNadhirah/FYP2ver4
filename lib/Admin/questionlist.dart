import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:umpds_test_sixedit/DatabaseManager/DatabaseManager.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({Key? key}) : super(key: key);

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {

  TextEditingController _questionController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();

  List questionList = [];
  String input = "";

  final TextEditingController _testController = TextEditingController();
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('test');

  @override
  void initState(){
    super.initState();
    fetchDatabaseList();
  }


  fetchDatabaseList() async{
    dynamic resultant = await DatabaseManager().getquestionList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        questionList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        title: Text(
          'Question Management',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
        actions: [
          RaisedButton(onPressed: (){
            openDialogueBox(context);
            setState(() {
              questionList.add(input);
            });
          },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: Colors.blueAccent,
          ),
        ],

      ),
      body: Container(
        child: ListView.builder(
          itemCount: questionList.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                title: Text(questionList[index]['question']),
                subtitle: Text(questionList[index]['category']),
                leading: IconButton(
                  onPressed: () async {
                    openDialogueBoxedit(context);
                  },
                  icon: Icon(
                    Icons.edit,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () async{
                    questionList.removeAt(index);
                  },
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
              ),
            );
          },
        )
      ),
    );
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Add new question'),
          content: Container(
            height: 100,
            width: 350,
            child: Column(
              children: [
                TextField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    hintText: 'category'
                  ),
                ),
                TextField(
                  controller: _questionController,
                  decoration: InputDecoration(
                      hintText: 'question'
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () async {
              await collectionReference.add({
                'category': _categoryController.text,
                'question': _questionController.text}).then((value) =>
                  _questionController.clear()).then((value) => _categoryController.clear());
              Navigator.pop(context);
            },
                child: Text('Submit'),),
            TextButton(onPressed: (){
              Navigator.pop(context);
            },
              child: Text('Cancel'),)
          ],
        );
      });

  }

  openDialogueBoxedit(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Edit question details'),
            content: Container(
              height: 100,
              width: 350,
              child: Column(
                children: [
                  TextField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                        hintText: 'category'
                    ),
                  ),
                  TextField(
                    controller: _questionController,
                    decoration: InputDecoration(
                        hintText: 'question'
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () async {
                await collectionReference.doc('').update({
                'category': _categoryController.text,
                'question': _questionController.text}).then((value) => print('updated'));
                Navigator.pop(context);
              },
                child: Text('Update'),),
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text('Cancel'),),

            ],
          );
        });

  }

}
