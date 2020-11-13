import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:fitness_tracker/calculative_brain.dart';

enum Gender{
   male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender selectedGender;
   int height = 180;
   int weight = 60;
   int age=19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? KActiveCardColour : KInactiveCardColour,
                    cardChild: iconContent(icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? KActiveCardColour : KInactiveCardColour,
                    cardChild: iconContent(icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour:KActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Height',
                  style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: KLabelTextStyle,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                         overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                             setState(() {
                               height = newValue.round();
                             });
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child:ReusableCard(
                    colour: KActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'WEIGHT',
                        style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onPressed: (){
                               setState(() {
                                 weight++;
                               });
                             },
                           ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                            onPressed: (){
                                setState(() {
                                  weight--;
                                });
                            },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: KActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                             'AGE',
                           style: KLabelTextStyle,
                         ),
                         Text(
                           age.toString(),
                           style: KNumberTextStyle,
                         ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                                width: 10.0
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        ),
                       ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE',
            onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText:calc.getResult(),
                   interpretation: calc.getInterpretation(),
                )));
            },
          ),
        ],
      ),
    );
  }
}




