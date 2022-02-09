import 'package:flutter/material.dart';

class AllMarks extends StatefulWidget {
  final int teamLength;
  final int teamMarks;
  final int resiLength;
  final int resiMarks;
  final int mindLength;
  final int mindMarks;
  final int integLength;
  final int integMarks;
  final int emoLength;
  final int emoMarks;
  final int creaLength;
  final int creaMarks;
  final int comLength;
  final int comMarks;
  final int adapLength;
  final int adapMarks;
  const AllMarks({Key? key,required this.teamLength, required this.teamMarks,
                            required this.resiLength, required this.resiMarks,
                            required this.mindLength,required this.mindMarks,
                            required this.integLength,required this.integMarks,
                            required this.emoLength,required this.emoMarks,
                            required this.creaLength,required this.creaMarks,
                            required this.comLength,required this.comMarks,
                            required this.adapLength,required this.adapMarks}) : super(key: key);

  @override
  _AllMarksState createState() => _AllMarksState();
}

class _AllMarksState extends State<AllMarks> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
