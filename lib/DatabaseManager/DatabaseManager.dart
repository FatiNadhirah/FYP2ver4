import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager{
  final CollectionReference questionList =
  FirebaseFirestore.instance.collection('test');

  Future<void> createQuestionData(
      String category, String question, String uid) async{
    return await questionList.doc(uid).set({
      'category': category,
      'question': question,
    });
  }

  Future updateQuestionList(String category, String question, String uid) async{
    return await questionList.doc(uid).update({
      'category': category, 'question': question
    });
  }

  Future getquestionList() async{
    List itemsList = [];
    try{
      await questionList.get().then((querySnapshot){
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    }catch (e){
      print(e.toString());
      return null;
    }
  }
}
