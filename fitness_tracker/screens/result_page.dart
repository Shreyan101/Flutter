import 'package:fitness_tracker/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                 alignment: Alignment.bottomLeft,
                 child: Text('Your Result',
               style: KTitleTextStyle,
                 ),
              ),
          ),
             Expanded(
                 flex: 5,
               child: ReusableCard(
                   colour: KActiveCardColour,
                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(resultText.toUpperCase(),
                       style: KResultTextStyle,
                       ),
                       Text(
                         bmiResult,
                         style: KBMITextStyle,
                       ),
                       Text(interpretation,
                       style: KBodyTextStyle,
                         textAlign: TextAlign.center,
                       ),

                     ],
                   ),
               ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
