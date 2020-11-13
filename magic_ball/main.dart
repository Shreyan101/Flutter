import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blueAccent,
      ),
      body: MyApp(),
    ),
  ),
);


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var picNum = 1;

  void changepic(){
    setState(() {
        picNum = Random().nextInt(5) + 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                   onPressed: (){
                     changepic();
                   },
                    child: Image.asset('images/ball$picNum.png'),
                ),
              ),
            ),
          ],
      ),
    );
  }
}



