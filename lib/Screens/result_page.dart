import 'package:bmi_calculator/Components/constant.dart';
import 'package:flutter/material.dart';
import '../Components/icon_content.dart';
import 'input_page.dart';
import 'package:bmi_calculator/Components/icon_content.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Calculator.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('YOUR RESULT',
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:Container(
              padding:EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child:Text(
                'YOUR RESULT',
                style:kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex:5,
              child:ReusableCard(
                colour:kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText.toUpperCase(),style:kResultTextStyle
                    ),
                    Text(bmiResult,style:kBMITextStyle
                    ),
                    Text(interpretation,style:kBodyTextStyle,
                      textAlign:TextAlign.center),
                  ],
                ),
              ),
          ),
         BottomButton(onTap:(){
           Navigator.pop(context);
         }, buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
