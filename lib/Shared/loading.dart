import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child:SpinKitChasingDots(
          color: Colors.blueAccent,
          size: 50,
          duration: Duration(seconds: 4),
        )
      ),
    );
  }
}
