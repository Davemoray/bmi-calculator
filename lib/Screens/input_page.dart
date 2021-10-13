import 'dart:ui';

import 'package:bmi_calculator/Calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import '../Components/constant.dart';
import 'result_page.dart';
import 'package:bmi_calculator/Components/icon_content.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';

enum Gender {male,female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender  selectedGender;
  int height = 180;
  int weight = 70;
  int age =19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:Row(
                children: <Widget>[
                   Expanded(
                     child:GestureDetector(
                       onTap: (){
                         setState(() {
                           selectedGender = Gender.male;
                         });
                       },
                      child:  ReusableCard(
                          colour: selectedGender == Gender.male?kActiveCardColor:kInactiveCardColor,//ternary operator
                      cardChild: IconContent(icon:FontAwesomeIcons.mars,label:'MALE')
                    ),),),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female?kActiveCardColor:kInactiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus,label:'FEMALE'),
                      ),
                    ),),

                ],
              ),),
          Expanded(
            child:ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                    style:kLabelTextStyle
                    ),
                  Padding(padding:EdgeInsets.only(top:1.0),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                      style: kNumberTextStyle
                      ),
                      Text('cm',
                      style: TextStyle(
                        fontSize:20.0,
                      ),)
                    ],
                  ),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child:Row(
            children: <Widget>[
              Expanded(child:ReusableCard(
                colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WEIGHT',
                    style:kLabelTextStyle,
                  ),
                  Text(weight.toString(),
                  style: kNumberTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(icon:FontAwesomeIcons.minus,
                      onPressed: (){
                        setState(() {
                          weight--;
                        });
                      },),
                      Padding(padding:EdgeInsets.only(right:10.0)),
                      RoundIconButton(icon:FontAwesomeIcons.plus,
                      onPressed: (){
                        setState(() {
                          weight++;
                        });
                      },),
                    ],
                  ),
                ],
              ),
              ),
              ),
              Expanded(child:ReusableCard(colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style:kLabelTextStyle,
                    ),
                    Text(age.toString(),
                      style: kNumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon:FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },),
                        Padding(padding:EdgeInsets.only(right:10.0)),
                        RoundIconButton(icon:FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),
                      ],
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),),
         BottomButton( onTap:(){
           CalculatorBrain calc = CalculatorBrain(height:height, weight: weight);
           Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
             bmiResult:calc.calculateBMI(),
             resultText: calc.getResult(),
             interpretation: calc.getInterpretation(),
           )));
         }, buttonTitle: 'CALCULATE YOUR BMI'),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      onPressed:onPressed,
      constraints: BoxConstraints.tightFor(
        width:56.0,
        height:56.0,
      ),
      shape: CircleBorder(),
      fillColor:Color(0xff4c4f5e),
    );
  }
}






