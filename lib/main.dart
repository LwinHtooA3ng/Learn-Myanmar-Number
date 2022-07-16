import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'img_inkwell.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myanmar Number',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Myanmar Number"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0,
        ),
        body: const SafeArea(
          child: Center(
            child: MyStatefulWidget(),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  int Num1 = 1;

  int Num2 = 1;

  int Num3 = 1;

  var correctNumbers = [];

  int _correctNumber = 1;

  void _refresh() {
    _numbers.shuffle();
    correctNumbers = [];
    Num1 = _numbers[0];
    Num2 = _numbers[5];
    Num3 = _numbers[8];
    correctNumbers.add(Num1);
    correctNumbers.add(Num2);
    correctNumbers.add(Num3);
    correctNumbers.shuffle();
    _correctNumber = correctNumbers[0];
  }

  void initState() {
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Select the number $_correctNumber",
              style: GoogleFonts.fredokaOne(
                textStyle: const TextStyle(
                    letterSpacing: 1.5,
                    wordSpacing: 10,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.indigoAccent),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MyInkWell(Num: Num1, CN: _correctNumber),
        MyInkWell(Num: Num2, CN: _correctNumber),
        MyInkWell(Num: Num3, CN: _correctNumber),

        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _refresh();
              });
            },
            style: ElevatedButton.styleFrom(primary: Colors.indigo),
            child: const Text("Refresh")),
      ],
    );
  }
}