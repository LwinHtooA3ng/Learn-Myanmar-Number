import 'package:flutter/material.dart';

class MyInkWell extends StatelessWidget {
  final int Num;

  final int CN;

  MyInkWell({Key? key, required this.Num, required this.CN}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Num == CN) {
          var snackbar = const SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
            content: Text(
              'Correct !',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        } else {
          var snackbar = const SnackBar(
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1),
            content: Text(
              'False !',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Image(
        image: AssetImage('images/$Num.png'),
        width: 80,
        height: 80,
      ),
    );
  }
}
