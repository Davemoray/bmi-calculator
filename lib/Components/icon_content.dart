import 'package:flutter/material.dart';
import 'constant.dart';
class IconContent extends StatelessWidget {

  final IconData icon;
  final String label;

  IconContent({@required this.icon,@required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
            size:80.0),
        Padding(padding:EdgeInsets.only(top:10.0)),
        Text(label,
          style:kLabelTextStyle
        ),
      ],
    );
  }
}

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonTitle;
BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top:10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child:Center(
          child: Text(buttonTitle,
            style:TextStyle(color:Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
