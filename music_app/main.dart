import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(soundNumber){
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }


  Expanded buildKey({Color color, int soundNumber}){
   return Expanded(
     child: FlatButton(
         color: color,
         onPressed:(){
           playSound(soundNumber);
         }),
   );
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(color: Colors.red, soundNumber: 1),
                buildKey(color: Colors.blueAccent, soundNumber: 2),
                buildKey(color: Colors.greenAccent, soundNumber: 3),
                buildKey(color: Colors.pink, soundNumber: 4),
                buildKey(color: Colors.yellowAccent, soundNumber: 5),
                buildKey(color: Colors.purpleAccent, soundNumber: 6),
                buildKey(color: Colors.orange, soundNumber: 7),
              ],
            ),
          ),
          ),
        ),
      );
  }
}
